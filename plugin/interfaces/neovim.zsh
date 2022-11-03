# Set Neovim color scheme.
if [[ -n "${BASE16_THEME:-}" ]]; then
  theme="base16-${BASE16_THEME}"
fi
export VIM_COLOR="${VIM_COLOR:-${theme:-OceanicNext}}"

# Set Neovim background.
if [[ -n "${BASE16_TYPE:-}" ]]; then
  background="light"
  if [[ $BASE16_TYPE =~ "(dark|night|dusk)" ]]; then
    background="dark"
  fi
fi
export VIM_BACKGROUND=${VIM_BACKGROUND:-${background:-dark}}

