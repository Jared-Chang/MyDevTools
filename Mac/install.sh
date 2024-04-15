# install Command Line Tools for XCode
set -u

if [[ -t 1 ]]
then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

TOUCH=("/usr/bin/touch")

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"
  do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

chomp() {
  printf "%s" "${1/"$'\n'"/}"
}

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

warn() {
  printf "${tty_red}Warning${tty_reset}: %s\n" "$(chomp "$1")" >&2
}

have_sudo_access() {
  if [[ ! -x "/usr/bin/sudo" ]]
  then
    return 1
  fi

  local -a SUDO=("/usr/bin/sudo")

  if [[ -z "${HAVE_SUDO_ACCESS-}" ]]
  then
    "${SUDO[@]}" -v && "${SUDO[@]}" -l mkdir &>/dev/null
    HAVE_SUDO_ACCESS="$?"
  fi

  if [[ "${HAVE_SUDO_ACCESS}" -ne 0 ]]
  then
    abort "Need sudo access on macOS (e.g. the user ${USER} needs to be an Administrator)!"
  fi

  return "${HAVE_SUDO_ACCESS}"
}

execute() {
  if ! "$@"
  then
    abort "$(printf "Failed during: %s" "$(shell_join "$@")")"
  fi
}

execute_sudo() {
  local -a args=("$@")
  if have_sudo_access
  then
    ohai "/usr/bin/sudo" "${args[@]}"
    execute "/usr/bin/sudo" "${args[@]}"
  else
    ohai "${args[@]}"
    execute "${args[@]}"
  fi
}

getc() {
  local save_state
  save_state="$(/bin/stty -g)"
  /bin/stty raw -echo
  IFS='' read -r -n 1 -d '' "$@"
  /bin/stty "${save_state}"
}

should_install_command_line_tools() {
  ! [[ -e "/Library/Developer/CommandLineTools/usr/bin/git" ]]
}

ohai 'Checking for `sudo` access (which may request your password)...'

have_sudo_access

if should_install_command_line_tools
then
  ohai "The Xcode Command Line Tools will be installed."
  ohai "Searching online for the Command Line Tools"
  clt_placeholder="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"
  execute_sudo "${TOUCH[@]}" "${clt_placeholder}"

  clt_label_command="/usr/sbin/softwareupdate -l |
                      grep -B 1 -E 'Command Line Tools' |
                      awk -F'*' '/^ *\\*/ {print \$2}' |
                      sed -e 's/^ *Label: //' -e 's/^ *//' |
                      sort -V |
                      tail -n1"
  clt_label="$(chomp "$(/bin/bash -c "${clt_label_command}")")"

  if [[ -n "${clt_label}" ]]
  then
    ohai "Installing ${clt_label}"
    execute_sudo "/usr/sbin/softwareupdate" "-i" "${clt_label}"
    execute_sudo "/usr/bin/xcode-select" "--switch" "/Library/Developer/CommandLineTools"
  fi
  execute_sudo "/bin/rm" "-f" "${clt_placeholder}"
fi

if should_install_command_line_tools && test -t 0
then
  ohai "Installing the Command Line Tools (expect a GUI popup):"
  execute "/usr/bin/xcode-select" "--install"
  echo "Press any key when the installation has completed."
  getc
  execute_sudo "/usr/bin/xcode-select" "--switch" "/Library/Developer/CommandLineTools"
fi

# install dev tools and settings

DEVTOOL_REPOSITORY=~/Documents/projects/MyDevTools
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
  rm -f ~/.zshrc
  ln $PWD/Mac/.zshrc ~/.zshrc
  rm -rf ~/.ssh
  ln -s $PWD/Mac/ssh ~/.ssh
  rm -rf ~/.myzsh
  ln -s $PWD/Mac/zsh ~/.myzsh
  mkdir -p ~/.aws
  rm -rf ~/.aws/config
  ln $PWD/Mac/aws/config ~/.aws/config
  
  softwareupdate --install-rosetta
  sh -c "$(curl -fsSL https://git.io/zinit-install)"
  sh $PWD/Mac/homebrew.sh
) || exit 1
