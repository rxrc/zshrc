# Add Git specific aliases.
if [[ -x $(command -v git) ]]; then
  alias gfup='git fetch --no-tags upstream'
  alias gfmk='git fetch --no-tags makenew'
  [[ -x $(command -v gap ) ]] || alias gap='git add --patch'
fi

if [[ -x $(command -v git) ]]; then
  gcome () {
    git checkout "${USER}/$1" $2
  }
fi

if [[ -x $(command -v git) ]]; then
  gcbme () {
    git checkout -b "${USER}/$1" $2
  }
fi

if [[ -x $(command -v gh) ]]; then
  ghver () {
    gh workflow run version.yml --raw-field version=$1
  }
fi

if [[ -x $(command -v gh) ]]; then
  ghrel () {
    jq -nc '{"event_type":"release","client_payload":{"environment":"'$1'"}}' | gh api repos/:owner/:repo/dispatches --input - | echo
  }
fi

if [[ -x $(command -v gh) ]]; then
  tag="$(git tag --points-at HEAD --sort -version:refname | head -1)"
  version="${tag#v}"
  ghpro () {
    jq -nc '{"event_type":"release","client_payload":{"environment":"'$1'", "version":"'$version'"}}' | gh api repos/:owner/:repo/dispatches --input - | echo
  }
fi
