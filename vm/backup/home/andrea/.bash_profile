
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# autologin starts X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

