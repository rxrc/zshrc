# Set binds for Word and line movement.
bindkey '^F' forward-word
bindkey '^V' backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Set binds for history-substring-search.
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
