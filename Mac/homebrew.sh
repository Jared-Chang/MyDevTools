/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask

brew install python3
brew install pyenv
pyenv install 3.9.1
eval "$(pyenv init -)"
pyenv global 3.9.1

brew install --cask jetbrains-toolbox
brew install --cask pycharm             //backup settings
brew install --cask visual-studio-code       //backup settings and plugin
brew install --cask iterm2              //backup iterm2 settings
brew install --cask docker

brew install --cask bettertouchtool     //backup btt plugin
brew install --cask sourcetrail
brew install --cask appcleaner
brew install --cask deepl
brew install --cask 1password
brew install --cask dash                //backup dash settings
brew install --cask alfred              
brew install --cask cheatsheet
brew install --cask royal-tsx           //backup royal-tsx settings
brew install --cask eul
brew install --cask betterzip
brew install --cask cleanshot
brew install --cask microsoft-edge 
brew install --cask slack

brew install autojump
brew install htop
brew install cookiecutter
brew install tmux