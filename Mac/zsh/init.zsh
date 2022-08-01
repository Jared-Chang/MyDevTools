# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f /opt/homebrew/bin/brew ]] || eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

eval "$(pyenv init --path)"
eval $(thefuck --alias)
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
PATH="$PATH:/Users/jaredchang/Library/Android/sdk/platform-tools"
PATH="$PATH:/Users/jaredchang/go/bin"
PATH="$PATH:/Users/jaredchang/.composer/vendor/bin"
PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
PATH="$PATH:/opt/homebrew/opt/mysql-client/bin"
PATH="/Users/jaredchang/Library/Android/sdk/tools/bin:$PATH"
PATH="/opt/homebrew/opt/node@16/bin:$PATH"
PATH="/opt/homebrew/opt/go@1.17/bin:$PATH"


