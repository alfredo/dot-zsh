# Autocompletion
autoload -Uz compinit && compinit

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

# Colours
autoload -U colors && colors

# History
HISTFILE=~/.histfile
HISTSIZE=999999999999999999
SAVEHIST=999999999999999999

# Python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh