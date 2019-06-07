alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias emx='emacs -nw'

# Management of .dotfiles
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'

alias tmux="TERM=screen-256color tmux"
alias tmx='tmux attach || tmux new'
alias ls='ls --color=auto'
alias ll='ls -la'

alias word="cat /dev/urandom | tr -cd 'a-f' | head -c 10"
alias msg="echo \"`word` `word` `word` `word` `word`\""

alias grep="grep --color=auto"

alias docker-rmi="docker images | grep '<none>' | awk '{ print \$3 }' | xargs docker rmi "
alias docker-rm="docker ps -a | awk '{print \$1}' | xargs docker rm"

alias cpwd='openssl rand -base64'

alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'

alias venv3='mkvirtualenv -p python3'

pip-up() {
    pip freeze | awk '{printf "puts [string range %s 0 [expr [string first = %s]-1]]\n", $1, $1}' | tclsh | xargs pip install --upgrade
}

alias gpull='git pull && git submodule update --recursive --remote'
alias gpulli='git pull && git submodule update --init --recursive --remote'

gdelbranch() {
    git branch -D $1 && git push origin --delete $1
}

alias es='sudo sysctl -w vm.max_map_count=262144'
alias tunnel_amazon='ssh -X -i ~/stuff/ssh/ml-key.pem ubuntu@ec2-35-158-142-68.eu-central-1.compute.amazonaws.com -L 0.0.0.0:8888:localhost:8888'

alias juno='jupyter notebook'

timestamp2date() {
    echo -n $@
    echo -n " "
    date -d @$@
}

date2timestamp() {
    echo -n "$* "
    date --date="$*" +"%s"
}
