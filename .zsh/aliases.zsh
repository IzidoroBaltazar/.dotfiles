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
    ansible-playbook -i ~/ws/scripts-repo/releng/ansible/hosts/jenkins ~/ws/scripts-repo/releng/ansible/read_ip_vm.yml --extra-vars "guestname=$1"
}

createVmFunc() {
    echo `ansible-playbook -i ~/ws/scripts-repo/releng/ansible/hosts/jenkins ~/ws/scripts-repo/releng/ansible/create_vm.yml --extra-vars "guestname=$1 template=$2" | tee /dev/tty | grep vm.ansible_facts.hw_eth0.ipaddresses | awk '{gsub(/"/, "", $2); print $2}'`
}

destroyVmFunc() {
    ansible-playbook -i ~/ws/scripts-repo/releng/ansible/hosts/jenkins ~/ws/scripts-repo/releng/ansible/destroy_vm.yml --extra-vars "guestname=$1"
}

alias createVm=createVmFunc
alias destroyVm=destroyVmFunc
alias getIp=getIpFunc
alias getVms='ansible-playbook -i ~/ws/scripts-repo/releng/ansible/hosts/jenkins ~/ws/scripts-repo/releng/ansible/get_all_vm_names.yml'

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
