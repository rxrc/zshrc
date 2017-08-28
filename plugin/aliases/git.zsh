# Git specific aliases.
if [[ -x $(command -v git) ]]; then
  alias gfup='git fetch --no-tags upstream'
  [[ -x $(command -v gap ) ]] || alias gap='git add --patch'
fi
