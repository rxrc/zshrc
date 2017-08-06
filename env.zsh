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

# Create Zsh history file directory.
if [[ ! -d $(dirname $HISTFILE) ]]; then
  mkdir -p $(dirname $HISTFILE)
fi

# Set ssh-agent socket.
if [[ -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Set editor.
export EDITOR='nvim'

# Set (Neo)Vim color scheme.
if [[ -z $VIM_COLOR ]]; then
  export VIM_COLOR=base16-$BASE16_THEME
fi

# Set (Neo)Vim background.
if [[ -z $VIM_BACKGROUND ]]; then
  export VIM_BACKGROUND=$BASE16_TYPE
fi

# Set fzf default command.
if [[ -x $(command -v fzf) && \
      -x $(command -v ag) ]]; then
  export FZF_DEFAULT_COMMAND='(ag -g "")'
fi

# Set kitchen-sync transfer mode.
export KITCHEN_SYNC_MODE=rsync
