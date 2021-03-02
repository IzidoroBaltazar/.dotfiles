STSIZE=5000000
HISTFILE=~/.zsh_history
SAVEHIST=5000000

bindkey -v
bindkey '^R' history-incremental-search-backward

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt extendedglob
setopt nomatch
