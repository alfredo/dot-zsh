#
# Sets general shell options and defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Smart URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# General
setopt BRACE_CCL          # Allow brace character class list expansion.
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed.

# Jobs
setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

# PATH
typeset -U cdpath fpath mailpath manpath path
typeset -UT INFOPATH infopath

cdpath=(
  $HOME
  $cdpath
)

infopath=(
  /usr/local/share/info
  /usr/share/info
  $infopath
)

manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
  manpath+=($(<$path_file))
done

path=(
  /usr/local/bin
  /usr/local/{,s}bin
  ~/bin
  /usr/{,s}bin
  /{,s}bin
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done

if [[ $OSTYPE == darwin* ]]; then
    path=(
        /opt/local/{,s}bin
         /usr/local/bin
        /opt/local/Library/Frameworks/Python.framework/Versions/Current/bin
        $path
    )

    manpath=(
        /opt/local/share/man
        $manpath
    )
fi

# Language
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# Editors
export EDITOR="vim"
export VISUAL="vim"
export PAGER='less'

# Grep
if zstyle -t ':omz:environment:grep' color; then
  export GREP_COLOR='37;45'
  export GREP_OPTIONS='--color=auto'
fi

# Browser (Default)
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
else
  if (( $+commands[xdg-open] )); then
    export BROWSER='xdg-open'
  fi
fi

# Less
export LESSCHARSET="UTF-8"
export LESSHISTFILE='-'
export LESSEDIT='vim ?lm+%lm. %f'
export LESS="-FSRXw"


# Termcap
if zstyle -t ':omz:environment:termcap' color; then
  export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
  export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
  export LESS_TERMCAP_me=$'\E[0m'          # end mode
  export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
  export LESS_TERMCAP_so=$'\E[00;47;30m'   # begin standout-mode
  export LESS_TERMCAP_ue=$'\E[0m'          # end underline
  export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline
fi
