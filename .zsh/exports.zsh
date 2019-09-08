# Environment variables for Golang
#export GOPATH=$HOME/Documents/workspace/gocode

# Environment variables for Java
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Enable color in grep
export GREP_OPTIONS='--color=auto'

# Redefining PATH
# PATH=$PATH:/home/${USER}/miniconda/bin

export EDITOR=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
