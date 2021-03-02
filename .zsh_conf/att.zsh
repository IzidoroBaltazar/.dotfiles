alias goUk='ssh -X mp5516@135.76.180.170'
alias goUk2='ssh -X mp5516@gbcdcgcs02.intl.att.com'
alias goDe='ssh -X mp5516@135.76.168.170'
alias goDe2='ssh -X mp5516@defragcs02.intl.att.com'
alias goDe3='ssh -X mp5516@defragcs03.intl.att.com'
alias goUs='ssh -X mp5516@m5deveet08.gcsc.att.com'

alias goDataOld='ssh -X -L 0.0.0.0:48855:localhost:48855 mp5516@zld00490.vci.att.com'
alias goData='ssh -X -L 0.0.0.0:48855:localhost:48855 mp5516@zld04959.vci.att.com'
alias goTask='ssh -X -L 0.0.0.0:48855:localhost:48855 mp5516@zld04959.vci.att.com'

alias dockerbuild='docker build --build-arg http_proxy="http://135.28.13.11:8888" --build-arg https_proxy="http://135.28.13.11:8888" --build-arg ftp_proxy="http://135.28.13.11:8888" --build-arg dns=135.76.169.248'
