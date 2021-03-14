working_directory=$(dirname "$0")

rm -f ~/.gitalias
ln $working_directory/../gitalias/gitalias.txt ~/.gitalias
rm -f ~/.gitconfig
ln $working_directory/.gitconfig ~/.gitconfig
rm -f ~/.p10k.zsh
ln $working_directory/.p10k.zsh ~/.p10k.zsh
rm -f ~/.zshrc
ln $working_directory/.zshrc ~/.zshrc
mkdir ~/.ssh
rm -f ~/.ssh/config
ln $working_directory/ssh.config ~/.ssh/config

softwareupdate --install-rosetta
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sh $working_directory/homebrew.sh