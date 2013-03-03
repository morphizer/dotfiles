#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ];then
	. /etc/bashrc
fi

EDITOR="VIM"

# History settings
HISTCONTROL=ignoreboth #ignoredups and ignorespace
HISTFILESIZE=1000000
HISTSIZE=10000

shopt -s checkwinsize # resize window
shopt -s cdspell # correct spelling errors for cd

export GREP_OPTIONS='--color=auto' # color for e/z/grep
export EDITOR

## Sys Commands ##
alias ll='ls -l'
alias la='ls -A'
alias lld='ls -ld'
alias webs='python -m SimpleHTTPServer'

# Use vim as pager instead of less
VLESS=$(find /usr/share/vim -name "less.sh")
if [ ! -z $VLESS ];then
    alias less=$VLESS
fi

# Prompt
parse_git_branch() {
	local b=$(git symbolic-ref HEAD 2> /dev/null)
	echo -n "${b#refs/heads/}"
}
PS1="[\u@\h \W \[\e[1;31m\]\$(parse_git_branch)\[\e[0m\]]\\$ "

## Games ##
alias wowvanilla='env WINEPREFIX=~/wineprefixes/wowvanilla wine "C:\Program Files\wow\WoW.exe"'
alias steam='env WINEPREFIX=~/wineprefixes/steam wine "C:\Program Files\Steam\Steam.exe"'

## Fun Aliases ##
alias persistclock="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-19));date;tput rc;done &"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
