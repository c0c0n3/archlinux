
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


#
# APPEARANCE
#

# Colorize output of ls and grep.
alias ls='ls --color=auto'
export GREP_COLOR="1;34"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

eval `dircolors -b`

# Simple prompt.
PS1='\$ '
export PROMPT_COMMAND=''

#
# My exports.
#
export EDITOR=emacs
export DARCS_EDITOR=emacs
export DARCS_ALWAYS_COLOR=1
export PATH=$PATH:$HOME/.cabal/bin
