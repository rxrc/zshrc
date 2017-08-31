# Set fzf default command.
if [[ -x $(command -v ag) ]]; then
  export FZF_DEFAULT_COMMAND=${FZF_DEFAULT_COMMAND:-'(ag -g "")'}
fi

# Always use fzf-tmux.
if [[ -x $(command -v fzf-tmux) ]]; then
  alias fzf='fzf-tmux'
fi
