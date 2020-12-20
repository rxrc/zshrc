# Add Git specific aliases.
if [[ -x $(command -v git) ]]; then
  alias gfup='git fetch --no-tags upstream'
  [[ -x $(command -v gap ) ]] || alias gap='git add --patch'
fi

if [[ -x $(command -v gh) ]]; then
  ghver () {
    # UPSTREAM: https://github.com/cli/cli/issues/2657
    # jq -nc '{"event_type":"version","client_payload":{"version":"'$1'"}}' | gh api repos/:owner/:repo/dispatches --input - | echo
    curl --fail \
      -H "Authorization: token $GITHUB_TOKEN" \
      -H 'Accept: application/vnd.github.v3+json' \
      -d '{"event_type":"version","client_payload":{"version":"v'$1'"}}' \
      -X POST "https://api.github.com/repos/$(jq -r .repository < package.json)/dispatches"
  }
fi
