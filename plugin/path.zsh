# Paths to add to PATH.
paths=(
  # Android tools and platform tools
  /opt/android-sdk/tools
  /opt/android-sdk/platform-tools

  # Local binaries
  $HOME/.local/bin

  # npm binaries
  $HOME/.npm/bin
)

# Add paths to PATH.
for p in $paths; do
  if [[ -d $p ]]; then
    export PATH=$PATH:$p
  fi
done

# Set Go path.
if [[ -d $HOME/go ]]; then
  export GOPATH="$HOME/go"
fi

# Add Go binaries to path.
if [[ ! -z "$GOPATH" && -d $GOPATH/bin ]]; then
  export PATH=$GOPATH/bin:$PATH
fi
