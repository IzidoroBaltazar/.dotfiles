if [[ ! -a ~/.zsh_conf/antigen.zsh ]]; then
    curl -L git.io/antigen > ~/.zsh_conf/antigen.zsh
fi
source ~/.zsh_conf/antigen.zsh
source ~/.zsh_conf/exports.zsh
source ~/.zsh_conf/history.zsh
source ~/.zsh_conf/completion.zsh
# source ~/.zsh_conf/att.zsh
# source ~/.zsh_conf/vpn-alias.zsh
source ~/.zsh_conf/aliases.zsh
source ~/.zsh_conf/keybind.zsh

# source /usr/bin/virtualenvwrapper.sh

antigen use oh-my-zsh

antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

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

if [[ -f /usr/local/bin/starship ]]; then
    eval "$(starship init zsh)"
else
    antigen bundle git
    # working ASCII theme
    antigen theme gdsrosa/minimal_improved
    antigen apply
fi
