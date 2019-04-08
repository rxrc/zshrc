# Set additional gems to be wrapped by bundler plugin.
BUNDLED_COMMANDS=(
  rubocop
  curate
)

# Start tmux on ssh login.
if ! [[ -z "$SSH_CONNECTION" && -z "$REMOTEHOST" ]]; then
  ZSH_TMUX_AUTOSTART=true
fi

# Disable AWS prompt.
SHOW_AWS_PROMPT=false
