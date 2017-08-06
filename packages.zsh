# Manage zplug with zplug.
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Load external environment overrides.
if [[ -f "${ZDOTDIR}/env.zsh" ]]; then
  source "${ZDOTDIR}/env.zsh"
fi

# Load Base16 theme.
base16_repo='chriskempson/base16-shell'
base16_theme=${BASE16_THEME:-tomorrow}
base16_type=${BASE16_TYPE:-night}
base16_script="base16-${base16_theme}-${base16_type}.sh"

if [[ ! -f "${ZPLUG_REPOS}/${base16_repo}/scripts/${base16_script}" ]]; then
  base16_script="base16-${base16_theme}.sh"
fi

zplug "${base16_repo}", defer:1, use:"scripts/${base16_script}"

# Load promptline.
zplug $ZDOTDIR, from:local, defer:1, use:promptline.zsh

# Load Oh-My-Zsh libs and plugins.
oh_my_zsh_libs=(
  clipboard
  directories
  history
)

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

for lib in $oh_my_zsh_libs; do
  zplug "lib/$lib", from:oh-my-zsh, defer:1
done

for plugin in $oh_my_zsh_plugins; do
  zplug "plugins/$plugin", from:oh-my-zsh, defer:1
done
