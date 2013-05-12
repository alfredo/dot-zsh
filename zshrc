# Autocompletion
autoload -U compinit && compinit

# Arrow key driven interface
zstyle ':completion:*' menu select
# Complete aliases as well
setopt completealiases

# Prompt style
autoload -U promptinit && promptinit
# This will set the default prompt to the walters theme
prompt walters

# Use emacs bindings
bindkey -e

# colours
autoload -U colors && colors
