# Manage zplug with zplug.
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug ${ZSHRC_REPO}, defer:2, use:plugin
