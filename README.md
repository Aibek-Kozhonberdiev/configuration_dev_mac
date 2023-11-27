## Homebrew
1. Install brew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Update brew:
```bash
brew update
```

## Installing all applications and modules
1. Install the following command-line tools:
```bash
brew install tree
brew install mongodb
brew install postgresql
brew install mysql
brew install neofetch
brew install redis
```
2. Install cask applications:
```bash
brew install --cask visual-studio-code
brew install --cask pycharm-ce-with-anaconda-plugin
brew install --cask google-chrome
brew install --cask tor-browser
brew install --cask postman
brew install --cask db-browser-for-sqlite
brew install --cask pgadmin4
brew install --cask arduino-ide
brew install --cask mongodb-compass
brew install --cask docker
brew install --cask iterm2
```

## Oh My Zsh
1. Install with curl:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
2. Powerlevel10k
```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
3. Syntax highlighting
```bash
brew install zsh-syntax-highlighting
```
4. Git
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
5. Settings ~/.zshrc:
```~/.zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:/usr/local/Cellar/libpq/15.3_1/bin

export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/Cellar/libpq/15.4/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```
6. Visual Studio Code
```json
"terminal.integrated.fontFamily": "MesloLGS NF"
```
