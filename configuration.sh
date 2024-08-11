#!/bin/bash

# Update Homebrew and install iterm2
brew update
brew install --cask iterm2

# Install and configure Oh My Zsh with additional plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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
source $zsh_syntax_highlighting
EOF

# Install basic tools
brew install tree
brew install mongodb-community@7.0
brew install postgresql@15
brew install mysql@8.0
brew install neofetch
brew install node
brew install nvim

# Install development tools and applications
brew install --cask visual-studio-code
brew install --cask pycharm-ce
brew install --cask google-chrome
brew install --cask tor-browser
brew install --cask postman
brew install --cask db-browser-for-sqlite
brew install --cask pgadmin4
brew install --cask mongodb-compass
brew install --cask docker
brew install --cask firefox
brew install --cask discord
