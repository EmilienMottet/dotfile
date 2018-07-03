# custo

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# export PATH="$HOME/.local/share/JetBrains/Toolbox/bin:$PATH"
# export PATH="/sbin:$PATH"
path+=(/sbin)
# export PATH="/usr/sbin:$PATH"
path+=(/usr/sbin)
# export PATH="/home/emilien/.local/bin:$PATH"
path+=(/home/emilien/.local/bin)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias emacs /home/emilien/.oh-my-zsh/plugins/emacs/emacsclient.sh --no-wait

export PATH=$PATH

typeset -U path
