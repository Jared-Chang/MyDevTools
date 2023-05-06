# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f /opt/homebrew/bin/brew ]] || eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

eval $(thefuck --alias)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
