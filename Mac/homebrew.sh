/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask
brew tap homebrew/cask-versions

brew upgrade git

# Python
brew install python3
pip install --upgrade pip

# library

brew install rustup-init
brew install go
brew install flutter
brew install tfenv
brew install nvm

# aws

brew install awscli

# session manager

curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
unzip sessionmanager-bundle.zip
sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin
rm ./sessionmanager-bundle.zip
rm -rf ./sessionmanager-bundle

brew install --cask aws-vault
# let keychains knows the aws-vault
security list-keychains -s `security list-keychains | xargs` ~/Library/Keychains/aws-vault.keychain-db
security set-keychain-settings ~/Library/Keychains/aws-vault.keychain-db

# IDE

brew install --cask jetbrains-toolbox   #backup settings
brew install --cask visual-studio-code  #backup settings and plugin
brew install --cask warp        
brew install --cask insomnia
brew install --cask gitkraken

# Containers
brew install --cask lens
brew install kubectl
brew install helm      
brew install --cask docker

# Misc

brew install --cask appcleaner
brew install --cask deepl
brew install --cask 1password
brew install --cask 1password/tap/1password-cli
brew install --cask alfred              
brew install --cask eul
brew install --cask cleanshot
brew install --cask brave-browser
brew install --cask slack
brew install --cask obsidian
brew install --cask mos
brew install --cask rectangle
brew install --cask todoist
brew install --cask dropbox
brew install --cask google-drive
brew install --cask hiddenbar
brew install --cask cron
brew install --cask arc
brew install --cask notion
brew install --cask discord
brew install --cask miro
brew install --cask daisydisk
brew install --cask microsoft-teams
brew install --cask alt-tab
brew install --cask http-toolkit
brew install --cask postman

# Command line tools

brew install htop
brew install tmux
brew install jq
brew install fd
brew install exa
brew install dog
brew install mysql-client
brew install glab
brew install gpg2

brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
