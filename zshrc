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
source ~/dot-zsh/environment.zsh


# History
source ~/dot-zsh/history.zsh

# Directory
source ~/dot-zsh/directory.zsh

# Python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
export PYTHONSTARTUP=$HOME/.python/startup.py

# Alias
source ~/dot-zsh/alias.zsh

# Completion
source ~/dot-zsh/completion.zsh
# Utility
source ~/dot-zsh/utility.zsh

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh
fpath=($fpath "/home/alfredo/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
