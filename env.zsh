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

# Set GnuPG home and gpg tty.
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export GPG_TTY=$(tty)

# Set editor.
export EDITOR='nvim'

# Set ignore file.
export IGNORE_FILE=${IGNORE_FILE:-$XDG_CONFIG_HOME/ignore}

# Set ssh-agent socket.
if [[ -z "$SSH_AUTH_SOCK" && -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Set npm paths.
export NPM_CONFIG_USERCONFIG=${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/config}
export NPM_CONFIG_CACHE=${NPM_CONFIG_CACHE:-$XDG_CACHE_HOME/npm}
export NPM_CONFIG_TMP=${NPM_CONFIG_TMP:-$XDG_RUNTIME_DIR/npm}

# Set Yarn paths.
export YARN_CACHE_FOLDER=${YARN_CACHE_FOLDER:-$XDG_CACHE_HOME/yarn}

# Set Node.js paths.
export NODE_REPL_HISTORY=${NODE_REPL_HISTORY:-$XDG_CACHE_HOME/node/repl_history}

# Set nvm path.
export NVM_DIR=${NVM_DIR:-$XDG_DATA_HOME/nvm}

# Set Babel path.
export BABEL_CACHE_PATH=${BABEL_CACHE_PATH:-$XDG_CACHE_HOME/babel/cache.json}

# Set pyenv path.
export PYENV_ROOT=${PYENV_ROOT:-$XDG_DATA_HOME/pyenv}

# Set rbenv path.
export RBENV_ROOT=${RBENV_ROOT:-$XDG_DATA_HOME/rbenv}

# Set Bundler path.
export BUNDLE_USER_HOME="${BUNDLE_USER_HOME:-$XDG_CONFIG_HOME/bundle}"

# Set HTTPie path.
export HTTPIE_CONFIG_DIR="${HTTPIE_CONFIG_DIR:-$XDG_CONFIG_HOME/httpie}"

# Set Vagrant path.
export VAGRANT_HOME=${VAGRANT_HOME:-$XDG_DATA_DIR/vagrant}

# Set Gradle path
export GRADLE_USER_HOME=${GRADLE_USER_HOME:-$XDG_CACHE_HOME/gradle}

# Set Kubernetes kubeconfig config path.
export KUBECONFIG=${KUBECONFIG:-$XDG_CONFIG_HOME/kube/config}

# Set Minikube path.
export MINIKUBE_HOME=${MINIKUBE_HOME:-$XDG_CACHE_HOME/minikube}

# Set Helm path.
export HELM_HOME=${HELM_HOME:-$XDG_CONFIG_HOME/helm}

# Set Go path.
if [[ -d $HOME/go ]]; then
  export GOPATH=${GOPATH:-$HOME/go}
fi
