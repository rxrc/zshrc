# Add zplug and zshrc man pages.
export MANPATH="${ZPLUG_HOME}/doc/man:${MANPATH}"
export MANPATH="$(dirname ${(%):-%x})/doc/man:${MANPATH}"

# Use XDG Base Directory Specification.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CONFIG_DIRS=${XDG_CONFIG_DIRS:-/etc/xdg}
export XDG_DATA_DIRS=${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}

# Set Zsh history file.
export HISTFILE=${HISTFILE:-$XDG_CACHE_HOME/zsh/history}

# Set editor.
export EDITOR='nvim'

# Set ssh-agent socket.
if [[ -z "$SSH_AUTH_SOCK" && -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Set npm paths.
export NPM_CONFIG_USERCONFIG=${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/config}
export NPM_CONFIG_CACHE=${NPM_CONFIG_CACHE:-$XDG_CACHE_HOME/npm}
export NPM_CONFIG_TMP=${NPM_CONFIG_TMP:-$XDG_RUNTIME_DIR/npm}

# Set Go path.
if [[ -d $HOME/go ]]; then
  export GOPATH=${GOPATH:-$HOME/go}
fi
