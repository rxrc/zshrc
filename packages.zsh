# Manage zplug with zplug.
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Load external environment variable overrides.
if [[ -f "${ZDOTDIR}/env.zsh" ]]; then
  source "${ZDOTDIR}/env.zsh"
fi

# Set Base16 theme and type.
export BASE16_THEME=${BASE16_THEME:-tomorrow}
export BASE16_TYPE=${BASE16_TYPE:-night}
base16_script="base16-${BASE16_THEME}-${BASE16_TYPE}.sh"
base16_repo='chriskempson/base16-shell'

# Ignore Base16 type if unsupported by theme.
if [[ ! -f "${ZPLUG_REPOS}/${base16_repo}/scripts/${base16_script}" ]]; then
  base16_script="base16-${base16_theme}.sh"
fi

# Load Base16 theme.
zplug "${base16_repo}", defer:1, use:"scripts/${base16_script}"

# Load promptline.
zplug $ZDOTDIR, from:local, defer:1, use:promptline.zsh, \
  if:"[ -f "${ZDOTDIR}/promptline.zsh" ]"

# Oh-My-Zsh libs to load.
oh_my_zsh_libs=(
  clipboard
  directories
  history
)

# Oh-My-Zsh plugins to load.
oh_my_zsh_plugins=(
  bundler
  cp
  extract
  gem
  git
  github
  golang
  heroku
  httpie
  lein
  nvm
  python
  pip
  rake
  rbenv
  rsync
  ruby
  vagrant
  vi-mode
  vim-interaction
)

# Load Oh-My-Zsh libs.
for lib in $oh_my_zsh_libs; do
  zplug "lib/$lib", from:oh-my-zsh, defer:1
done

# Load Oh-My-Zsh plugins.
for plugin in $oh_my_zsh_plugins; do
  zplug "plugins/$plugin", from:oh-my-zsh, defer:1
done