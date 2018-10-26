if [[ ! -a ~/.zsh/antigen.zsh ]]; then
    curl -L git.io/antigen > ~/.zsh/antigen.zsh
fi
source ~/.zsh/antigen.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/history.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/att.zsh
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
antigen theme agnoster

antigen apply
