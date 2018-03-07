alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias emx='emacs -nw'

alias tmux="TERM=screen-256color tmux"
alias tmx='tmux attach || tmux new'
alias ls='ls --color=auto'
alias ll='ls -la'

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias vpn='sudo openvpn /etc/openvpn/frinx.ovpn'
alias stopVpn='sudo pkill openvpn'

alias goUk='ssh -X mp5516@135.76.180.170'
alias goDe='ssh -X mp5516@135.76.168.170'

alias dockerbuild='docker build --build-arg http_proxy="http://135.28.13.11:8888" --build-arg https_proxy="http://135.28.13.11:8888"'
alias cpwd='openssl rand -base64'

alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'

alias venv3='mkvirtualenv -p python3'
