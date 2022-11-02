# Set Neovim color scheme.
if [[ -n "${BASE16_THEME:-}" ]]; then
  theme="base16-${BASE16_THEME}"
fi
export VIM_COLOR="${VIM_COLOR:-${theme:-OceanicNext}}"

# Set Neovim background.
export VIM_BACKGROUND=${VIM_BACKGROUND:-${BASE16_TYPE:-dark}}

