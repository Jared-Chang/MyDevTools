# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

eval "$(pyenv init -)"

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias l="ls -lA"
alias g="git"
alias lg="l | grep -i"

to-bpe-workstation-1() {
  establish_proxy bpe-workstation-1 5050 8080
}

to-kkbox-corp-bpe-workstation() {
  establish_proxy kkbox-corp-bpe-workstation 5050 8080
}

establish_proxy() {
  readonly ssh_server_url=${1:?"The ssh server url/ip must specified."}
  readonly ssh_tunnel_port=${2:?"The ssh tunnel port must specified."}
  readonly proxy_port=${3:?"The proxy port must specified."}

  tunnel_response=$(tmux new-session -s ssh_tunnel -d "ssh -D $ssh_tunnel_port $ssh_server_url" 2>&1)
  proxy_response=$(tmux new-session -s http_proxy -d "hpts -s 127.0.0.1:$ssh_tunnel_port -p $proxy_port" 2>&1)

  if [ "$tunnel_response" = 'duplicate session: ssh_tunnel' ] || [ "$proxy_response" = 'duplicate session: http_proxy' ]; then
    echo "Proxy already established, please \033[0;31m disestablish_proxy \033[0m if you want to establish new proxy"
    return
  fi

  echo "http proxy to \033[0;31m$ssh_server_url\033[0m has established on \033[0;31m$proxy_port\033[0m"
}

disestablish_proxy() {
  tmux kill-session -t ssh_tunnel
  tmux kill-session -t http_proxy

  echo "http proxy has disestablished"
}

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node    

### End of Zinit's installer chunk

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker
zinit ice as"completion"
zinit snippet OMZ::plugins/docker-compose/_docker-compose

zinit load djui/alias-tips

zinit ice depth=1
zinit light romkatv/powerlevel10k 