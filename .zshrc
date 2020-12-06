if [[ ! -a ~/.zsh/antigen.zsh ]]; then
    curl -L git.io/antigen > ~/.zsh/antigen.zsh
fi
source ~/.zsh/antigen.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/history.zsh
source ~/.zsh/completion.zsh
# source ~/.zsh/att.zsh
# source ~/.zsh/vpn-alias.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/keybind.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# working ASCII theme
antigen theme gdsrosa/minimal_improved

antigen apply

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/martin/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/martin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/martin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/martin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
if [[ -a /usr/loca/bin/starship ]]; then
    eval "$(starship init zsh)"
fi
