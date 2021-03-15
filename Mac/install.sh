# string formatters
if [[ -t 1 ]]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"; do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

execute() {
  if ! "$@"; then
    abort "$(printf "Failed during: %s" "$(shell_join "$@")")"
  fi
}

# installation

DEVTOOL_REPOSITORY=~/project/MyDevTools
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