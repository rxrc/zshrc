# Create Zsh history file directory.
if [[ ! -d $(dirname $HISTFILE) ]]; then
  mkdir -p $(dirname $HISTFILE)
fi

# Create Node.js history file directory.
if [[ ! -d $(dirname $NODE_REPL_HISTORY) ]]; then
  mkdir -p $(dirname $NODE_REPL_HISTORY)
fi

# Update zshrc.
zshupg () {
  zplug update
  zplug install
  zplug clean
}
