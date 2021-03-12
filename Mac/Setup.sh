working_directory=$(dirname "$0")

rm -f ~/.gitalias
ln $dir/../gitalias/gitalias.txt ~/.gitalias
rm -f ~/.gitconfig
ln $dir/.gitconfig ~/.gitconfig
rm -f ~/.p10k.zsh
ln $dir/.p10k.zsh ~/.p10k.zsh
rm -f ~/.zshrc
ln $dir/.zshrc ~/.zshrc
mkdir ~/.ssh
rm -f ~/.ssh/config
ln $dir/ssh.config ~/.ssh/config

softwareupdate --install-rosetta
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sh $dir/homebrew.sh