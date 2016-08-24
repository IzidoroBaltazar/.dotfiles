alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

#alias tmux="TERM=screen-256color-bce tmux"
alias tmux="TERM=screen-256color tmux"
alias tmx='tmux attach || tmux new'
alias ls='ls --color=auto'

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias goWans="cd ~/ws/scripts-repo/releng/ansible"
alias goAns="cd ~/ansible"
alias startof='docker start pg-redmine pg-gerrit gerrit redmine jenkins nexus proxy'

alias vpn='sudo openvpn /etc/openvpn/frinx.ovpn'
alias stopVpn='sudo pkill openvpn'

getIpFunc() {
    ansible-playbook -i hosts ~/ws/scripts-repo/releng/ansible/vsphere/read_ip.yml --extra-vars "guestname=$1"
}

createVmFunc() {
    ansible-playbook -i hosts ~/ws/scripts-repo/releng/ansible/vsphere/create.yml --extra-vars "guestname=$1 template=$2"
}

destroyVmFunc() {
    ansible-playbook -i hosts ~/ws/scripts-repo/releng/ansible/vsphere/destroy.yml --extra-vars "guestname=$1"
}

alias createVm=createVmFunc
alias destroyVm=destroyVmFunc
alias getIp=getIpFunc
alias getVms='ansible-playbook -i hosts ~/ws/scripts-repo/releng/ansible/vsphere/get_all_names.yml'

connect() {
    load_key $1
    ssh jenkins@10.10.199.$1
}
alias goLab=connect

connectpt() {
    load_key_ptuser $1
    ssh ptuser@10.10.199.$1
}
alias goLabp=connectpt
