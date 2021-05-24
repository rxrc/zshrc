# Add Git specific aliases.
if [[ -x $(command -v git) ]]; then
  alias gfup='git fetch --no-tags upstream'
  alias gfmk='git fetch --no-tags makenew'
  [[ -x $(command -v gap ) ]] || alias gap='git add --patch'
fi

if [[ -x $(command -v gh) ]]; then
  ghver () {
    jq -nc '{"event_type":"version","client_payload":{"version":"'$1'"}}' | gh api repos/:owner/:repo/dispatches --input - | echo
  }
fi

if [[ -x $(command -v gh) ]]; then
  ghrel () {
    jq -nc '{"event_type":"release","client_payload":{"environment":"'$1'"}}' | gh api repos/:owner/:repo/dispatches --input - | echo
  }
fi
