# Format the prompt to include useful information about actual git repository
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "%r/%S [%b](%a) %m%u%c "
precmd() { vcs_info }
setopt prompt_subst
#PROMPT='${vcs_info_msg_0_}%# '
autoload -U colors && colors
#PROMPT='%(z ${vcs_info_msg_0_}.%~.${vcs_info_msg_0_})%(?..[%?]) %# '
#PROMPT='%n@%m %~ %(?..[%?] )%# '
PROMPT='%~ %(?..[%?] )%# '
