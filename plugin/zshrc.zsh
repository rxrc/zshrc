# Create Zsh history file directory.
if [[ ! -d $(dirname $HISTFILE) ]]; then
  mkdir -p $(dirname $HISTFILE)
fi

# Update zshrc.
function zshupg () {
  zplug update
  zplug install
  zplug clean
}
