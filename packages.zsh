# Manage zplug with zplug.
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Load external environment variable overrides.
if [[ -f "${ZDOTDIR}/env.zsh" ]]; then
  source "${ZDOTDIR}/env.zsh"
fi

# Set Base16 theme and type.
export BASE16_THEME=${BASE16_THEME:-onedark}
export BASE16_TYPE=${BASE16_TYPE:-}
base16_full_theme="base16-${BASE16_THEME}"
if [[ -n "${BASE16_TYPE}" ]]; then
  base16_full_theme="${base16_full_theme}-${BASE16_TYPE}"
fi
base16_script="base16-${base16_full_theme}.sh"
base16_repo='chriskempson/base16-shell'

# Ignore Base16 type if unsupported by theme.
if [[ ! -f "${ZPLUG_REPOS}/${base16_repo}/scripts/${base16_script}" ]]; then
  base16_script="base16-${BASE16_THEME}.sh"
fi

# Load Base16 theme.
zplug "${base16_repo}", defer:1, use:"scripts/${base16_script}"

# Set ZSH theme.
export ZSH_THEME=${ZSH_THEME:-pure}

# Load promptline.
zplug "${ZDOTDIR}", from:local, defer:1, use:promptline.zsh, \
  if:"[ "$ZSH_THEME" = 'promptline' -a -f "${ZDOTDIR}/promptline.zsh" ]"

# Load pure.
zplug 'mafredri/zsh-async', defer:1, from:github, \
  if:"[ $ZSH_THEME = 'pure' ]"
zplug 'sindresorhus/pure', use:pure.zsh, defer:2, from:github, as:theme, \
  if:"[ $ZSH_THEME = 'pure' ]"

# Load autosuggest.
export ZSH_AUTOSUGGEST_USE_ASYNC=true
zplug 'zsh-users/zsh-autosuggestions', defer:1

# Load syntax highlighing.
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# Load substring history search.
zplug 'zsh-users/zsh-history-substring-search', defer:3

# Load fzf plugin.
export FZF_SHARE_PATH=${FZF_SHARE_PATH:-/usr/share/fzf}
zplug "${FZF_SHARE_PATH}", from:local, defer:1, use:fzf.zsh, \
  if:"[ -f "${FZF_SHARE_PATH}/fzf.zsh" ]"

# Oh-My-Zsh libs to load.
oh_my_zsh_libs=(
  clipboard
  compfix
  completion
  diagnostics
  directories
  functions
  git
  grep
  history
  key-bindings
  misc
  prompt_info_functions
  spectrum
  termsupport
  theme-and-appearance
)

# Oh-My-Zsh plugins to load.
oh_my_zsh_plugins=()

## Core
oh_my_zsh_plugins+=(
  archlinux
  colored-man-pages
  colorize
  cp
  dotenv
  emoji
  encode64
  extract
  git # TODO: More git plugins?
  rsync
  systemd
  vi-mode
  # TOTO: safe-paste ?
)

## Developer tools
oh_my_zsh_plugins+=(
  aws
  helm
  httpie
  kubectl
  terraform
  # TODO: lol ?
)

## Clojure
oh_my_zsh_plugins+=(
  lein
)

## Haskell
oh_my_zsh_plugins+=(
  stack
)

## Node
oh_my_zsh_plugins+=(
  nvm
  npm
  yarn
)

## Python
oh_my_zsh_plugins+=(
  # pyenv
  pep8
  pip
  poetry
  pylint
  python
)

## Ruby
oh_my_zsh_plugins+=(
  bundler
  gem
  rake
  # rbenv
  ruby
)

# Load Oh-My-Zsh libs.
for lib in $oh_my_zsh_libs; do
  zplug "lib/${lib}", from:oh-my-zsh, defer:1
done

# Load Oh-My-Zsh plugins.
for plugin in $oh_my_zsh_plugins; do
  zplug "plugins/${plugin}", from:oh-my-zsh, defer:1
done

# Only load tmux plugins when tmux is installed.
oh_my_zsh_tmux_plugins=(tmux tmuxinator)
for plugin in $oh_my_zsh_tmux_plugins; do
  zplug "plugins/${plugin}", from:oh-my-zsh, defer:1, \
    if:'[ -x $(command -v tmux) ]'
done

# Load forked Oh-My-Zsh plugins.
zplug 'rxfork/oh-my-zsh', use:'plugins/pyenv', defer:1, at:env-path
zplug 'rxfork/oh-my-zsh', use:'plugins/rbenv', defer:1, at:env-path

# Load zsh extensions from local packages.
zplug "/etc/profile.d", from:local

zplug "${ZSHRC_REPO}", defer:2, use:plugin
zplug "${ZSHRC_REPO}", defer:2, use:plugin/interfaces
zplug "${ZSHRC_REPO}", defer:2, use:plugin/aliases
zplug "${ZSHRC_REPO}", defer:2, use:plugin/bindings
