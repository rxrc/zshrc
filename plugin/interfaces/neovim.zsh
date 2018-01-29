# Set Neovim color scheme.
theme=''
if [[ -$BASE16_THEME ]]; then
  theme="-${BASE16_THEME}"
fi
export VIM_COLOR="${VIM_COLOR:-base16${theme}}"

# Set Neovim background.
export VIM_BACKGROUND=${VIM_BACKGROUND:-$BASE16_TYPE}

# Disable neovim-gtk headerbar.
export NVIM_GTK_NO_HEADERBAR=1
