# Settings

For Ubuntu Mate and usual useful tools as VIM, emacs, zsh, tmux

## Get started
Code below will modify environment to use `.dotfiles` settings.
```bash
git clone git@github.com:IzidoroBaltazar/.dotfiles.git
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias updateDotfiles='dgit reset --hard'
dgit
updateDotFiles
```
