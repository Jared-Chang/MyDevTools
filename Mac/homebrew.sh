/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask

brew upgrade git

# Python
brew install python3
brew install pyenv
pyenv install 3.10.0
eval "$(pyenv init -)"
pyenv global 3.10.0
pip install --upgrade pip

# go

brew install go

# aws

brew install awscli

# IDE

brew install --cask jetbrains-toolbox   #backup settings
brew install --cask visual-studio-code  #backup settings and plugin
brew install --cask iterm2              #backup iterm2 settings
brew install --cask docker
brew install --cask postman

# Misc

brew install --cask bettertouchtool     #backup btt plugin
brew install --cask appcleaner
brew install --cask deepl
brew install --cask 1password
brew install --cask dash                #backup dash settings
brew install --cask alfred              
brew install --cask cheatsheet
brew install --cask eul
brew install --cask betterzip
brew install --cask cleanshot
brew install --cask microsoft-edge 
brew install --cask slack
brew install --cask adobe-acrobat-reader
brew install --cask obsidian

# Command line tools

brew install htop
brew install tmux
brew install jq
brew install fd
brew install exa
brew install dog
brew install mysql-client
