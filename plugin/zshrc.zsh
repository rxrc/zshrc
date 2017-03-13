# Update zshrc.
function zshupg () {
  zplug update
  zplug install
  zplug clean
}
