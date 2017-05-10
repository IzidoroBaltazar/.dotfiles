# Environment variables for Golang
#export GOPATH=$HOME/Documents/workspace/gocode

# Environment variables for Java
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Enable color in grep
export GREP_OPTIONS='--color=auto'

# Redefining PATH
#PATH=$GOPATH/bin:$PATH
if [[ ! -d ~/virtualenvs ]]; then
    mkdir ~/virtualenvs
fi
export WORKON_HOME=~/virtualenvs
source virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=~/virtualenvs

export EDITOR=nvim
