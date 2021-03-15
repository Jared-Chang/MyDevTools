if [[ -z "$1" ]]; then
  echo "You must provide a path for dev tool repository"
  exit 1
fi

DEVTOOL_REPOSITORY=$1
DEVTOOL_REMOTE_REPOSITORY="https://github.com/QiFenPocket/MyDevTools"

mkdir -p $DEVTOOL_REPOSITORY

ohai "Downloading and installing Mac DevTool..."
(
  cd "${DEVTOOL_REPOSITORY}" >/dev/null || return

  execute "git" "init" "-q"

  execute "git" "config" "remote.origin.url" "${DEVTOOL_REMOTE_REPOSITORY}"
  execute "git" "config" "remote.origin.fetch" "+refs/heads/*:refs/remotes/origin/*"

  execute "git" "config" "core.autocrlf" "false"

  execute "git" "fetch" "--force" "origin"
  execute "git" "fetch" "--force" "--tags" "origin"

  execute "git" "reset" "--hard" "origin/master"
  
  rm -f ~/.gitalias
  ln $PWD/gitalias/gitalias.txt ~/.gitalias
  rm -f ~/.gitconfig
  ln $PWD/Mac/.gitconfig ~/.gitconfig
  rm -f ~/.p10k.zsh
  ln $PWD/Mac/.p10k.zsh ~/.p10k.zsh
  rm -f ~/.zshrc
  ln $PWD/Mac/.zshrc ~/.zshrc
  rm -rf ~/.ssh
  ln -s $PWD/Mac/ssh ~/.ssh
  
  softwareupdate --install-rosetta
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
  sh $PWD/Mac/homebrew.sh
) || exit 1