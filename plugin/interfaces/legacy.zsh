# Always use nvim.
[[ -x $(command -v nvim) ]] && alias vi='nvim'
[[ -x $(command -v nvim) ]] && alias vim='nvim'

# Additional vim aliases.
[[ -x $(command -v nvim-gtk) ]] && alias vv='nvg'
[[ -x $(command -v nvim-qt) ]] && alias vv='nvq'

# ack is ack-grep on some systems.
[[ -x $(command -v ack-grep) ]] && alias ack='ack-grep'

# Add alias for tmuxinator.
[[ -x $(command -v tmuxinator) ]] && alias mux='tmuxinator'

# Copy to clipboard with xclip.
[[ -x $(command -v xclip ) ]] && alias cb='xclip -selection clipboard'

# Fixes a bug with rake and square brackets.
alias rake='noglob bundle exec rake'

# Make use of aura over pacman and add helpful aura aliases.
if [[ -x $(command -v aura) ]]; then
  alias pacman='aura'
  alias aura='sudo aura'
  alias aurin='aura -A'
  alias aurupg='aura -Au'
fi

# Find: [f]ile by name.
ff () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify a search string.'
    return 1
  fi

  find . -name "$1"
}

# Find: name [a]ll.
fa () { ff "*${1}*" }

# Find: name [s]tarts with.
fs () { ff "${1}*" }

# Find name [e]nds with.
fe () { ff "*${1}" }

# Update Arch Linux mirrorlist.
mirrorupg () {
  sudo reflector \
    --verbose -l 5 -c US -p https \
    --sort rate --save /etc/pacman.d/mirrorlist
}

# Start a local http server.
pyserver () {
  python -m http.server $1
}

# Generate an SSL certificate for test use only.
sslgen-cert-test () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify name to use.'
    return 1
  fi

  openssl req -new -x509 -nodes -newkey rsa:2048 -keyout $1.key -out $1.pem -days 36524 \
    -subj "/C=US/ST=California/L=San Francisco/O=Example Inc./CN=$1/emailAddress=webmaster@example.com"
}

# Create a new tar archive.
tarz () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify directory to use.'
    return 1
  fi

  tar -czf $1.tar.gz $1
}

# Open neovim-qt and hide output.
nvq () {
  if ! [[ -x $(command -v nvim-qt ) ]]; then
    echo 'neovim-qt is not installed.'
    exit 1
  fi

  nohup nvim-qt --no-ext-tabline $1 &>/dev/null &
}

# Open neovim-gtk and hide output.
nvg () {
  if ! [[ -x $(command -v nvim-gtk ) ]]; then
    echo 'neovim-gtk is not installed.'
    exit 1
  fi

  nohup nvim-gtk $1 &>/dev/null &
}

# Upgrade tmuxrc.
tmuxupg () {
  if ! [[ -d $HOME/.tmux/plugins/tpm ]]; then
    echo 'tpm is not installed.'
    return 1
  fi

  if ! [[ -n "$TMUX" ]]; then
    echo 'Run in a tmux session up update.'
    return 2
  fi

  $HOME/.tmux/plugins/tpm/bin/update_plugins all && \
  $HOME/.tmux/plugins/tpm/bin/install_plugins    && \
  $HOME/.tmux/plugins/tpm/bin/update_plugins all
}

# Open Viewnior and hide output.
vn () {
  if ! [[ -x $(command -v viewnior ) ]]; then
    echo 'Viewnior is not installed.'
    exit 1
  fi

  nohup viewnior $1 &>/dev/null &
}

# Open Zathura and hide output.
zt () {
  if ! [[ -x $(command -v zathura ) ]]; then
    echo 'Zathura is not installed.'
    exit 1
  fi

  nohup zathura $1 &>/dev/null &
}

# Upgrade nvimrc.
nvimupg () {
  if ! [[ -e $XDG_CONFIG_HOME/nvim/autoload/plug.vim ]]; then
    echo 'vim-plug is not installed.'
    return 1
  fi

  nvim -c PlugUpgrade -c qall
  nvim -c PlugUpdate -c qall
  nvim -c PlugInstall -c qall
  nvim -c PlugClean! -c qall
}

# Upgrade vimrc.
vimupg () {
  if ! [[ -e $HOME/.vim/autoload/plug.vim ]]; then
    echo 'vim-plug is not installed.'
    return 1
  fi

  vim -c PlugUpgrade -c qall
  vim -c PlugUpdate -c qall
  vim -c PlugInstall -c qall
  vim -c PlugClean! -c qall
}

# Add Git specific aliases.
if [[ -x $(command -v git) ]]; then
  alias gfup='git fetch --no-tags upstream'
  [[ -x $(command -v gap ) ]] || alias gap='git add --patch'
fi

mx () {
  if ! [[ -x $(command -v tmuxinator ) ]]; then
    echo 'tmuxinator is not installed.'
    exit 1
  fi

  if ! [[ -n "$1" ]]; then
    tmuxinator start default
  else
    tmux attach -t $1 || tmux new-session -s $1
  fi
}

gitsed () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify sed command.'
    return 1
  fi

  git ls-files -z | xargs -0 sed -i $1
}

# Load nvm
alias load_nvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
alias nvm='unalias nvm && load_nvm && nvm'
