#!/bin/bash

# Variable to store username
user=$(whoami)
echo "Hi, $user!!!"

# Installing Homebrew
NONINTERACTIVE=1 ruby -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update Homebrew and install iterm2
brew update
brew install --cask iterm2

# Install and configure Oh My Zsh with additional plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestionsъ

# Add settings to ~/.zshrc
zsh_syntax_highlighting=$(find /Users -name 'zsh-syntax-highlighting.zsh')
touch ~/.zshrc
cat <<EOF >> ~/.zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
git
zsh-autosuggestions
python
pip
docker
docker-compose
npm
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

# Check if the variable zsh_syntax_highlighting was found and is not empty
if [ -n "$zsh_syntax_highlighting" ]; then
  echo "source $zsh_syntax_highlighting" >> ~/.zshrc
else
  echo "zsh-syntax-highlighting.zsh not found"
fi

# Install basic tools
brew install tree
brew install postgresql@15
brew install neofetch
brew install node
brew install nvim
brew install python@3.11
brew install python@3.12

# Install development tools and applications
brew install --cask visual-studio-code
brew install --cask pycharm-ce
brew install --cask google-chrome
brew install --cask tor-browser
brew install --cask postman
brew install --cask db-browser-for-sqlite
brew install --cask pgadmin4
# brew install --cask docker
brew install --cask firefox
brew install --cask discord
#brew install --cask virtualbox

# Changing settings in vscode
cat <<EOF >> ~/Library/Application\ Support/Code/User/settings.json
{
    "files.autoSave": "afterDelay",
    "workbench.colorTheme": "Cobalt Next Dark",
    "workbench.iconTheme": "material-icon-theme",
    "editor.cursorBlinking": "expand",
    "workbench.colorCustomizations": {
        "[Cobalt Next Dark]": {
            "editorCursor.foreground": "#ebe5e5"
        }
    },
    "terminal.integrated.fontFamily": "MesloLGS NF"
}
EOF

# To install extensions in vscode
extension="ms-ceintl.vscode-language-pack-ru
ms-python.debugpy
ms-python.python
shahilkumar.docxreader
ms-python.vscode-pylance
tomoki1207.pdf
dline.cobaltnext
grapecity.gc-excelviewer
pkief.material-icon-theme
ritwickdey.liveserver"

# Install extensions from the list
echo "$extension" | while IFS= read -r ext; do
    code --install-extension "$ext"
done
