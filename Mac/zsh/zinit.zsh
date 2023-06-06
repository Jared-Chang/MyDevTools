### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit ice lucid wait="0" atload='eval "$(aws-vault --completion-script-zsh)"'
zinit ice lucid wait="0" atload='complete -C "/opt/homebrew/bin/aws_completer" aws'
zinit ice lucid wait="0" atload='source <(kubectl completion zsh)'

zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit snippet OMZ::plugins/aws
zinit snippet OMZ::plugins/fzf

zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker
zinit ice as"completion"
zinit snippet OMZ::plugins/docker-compose/_docker-compose

zinit ice lucid wait='0'
zinit light djui/alias-tips

zinit ice lucid wait='0'
zinit light agkozak/zsh-z

zinit ice depth=1
zinit light romkatv/powerlevel10k 

zinit ice lucid wait='0'
zinit light Aloxaf/fzf-tab

zstyle ':completion:*:*:aws' fzf-search-display true
