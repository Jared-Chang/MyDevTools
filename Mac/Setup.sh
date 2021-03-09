sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sh $0/homebrew.sh

ln $0/../gitalias/gitalias.txt ~/.gitalias
ln $0/.gitconfig ~/.gitconfig
ln $0/.p10k.zsh ~/.p10k.zsh
ln $0/.zshrc ~/.zshrc
ln $0/ssh.config ~/.ssh/config