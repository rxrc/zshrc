# Set binds for history-substring-search.
if zplug check zsh-users/zsh-history-substring-search; then
  bindkey '^P' history-substring-search-up
  bindkey '^N' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi
