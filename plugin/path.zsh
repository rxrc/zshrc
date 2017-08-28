# Paths to add to PATH.
paths=(
  # Android tools and platform tools
  /opt/android-sdk/tools
  /opt/android-sdk/platform-tools

  # Go binaries
  $GOPATH/bin

  # Local binaries
  $HOME/.local/bin
)

# Add paths to PATH.
for p in $paths; do
  if [[ -d $p ]]; then
    export PATH=$PATH:$p
  fi
done
