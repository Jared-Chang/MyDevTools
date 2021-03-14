script_path=$(cd "$(dirname "$0")"; pwd -P)

rm -f ~/.gitalias
ln $script_path/../gitalias/gitalias.txt ~/.gitalias
rm -f ~/.gitconfig
ln $script_path/.gitconfig ~/.gitconfig
rm -f ~/.p10k.zsh
ln $script_path/.p10k.zsh ~/.p10k.zsh
rm -f ~/.zshrc
ln $script_path/.zshrc ~/.zshrc
rm -rf ~/.ssh
ln -s $script_path/ssh ~/.ssh

softwareupdate --install-rosetta
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sh $script_path/homebrew.sh