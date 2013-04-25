# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ];then
	. /etc/bashrc
fi

EDITOR="vim"

# History settings
HISTCONTROL=ignoreboth #ignoredups and ignorespace
HISTFILESIZE=1000000
HISTSIZE=10000

shopt -s checkwinsize # resize window
shopt -s cdspell # correct spelling errors for cd

export GREP_OPTIONS='--color=auto' # color for e/z/grep
export EDITOR

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


# Source common aliases
if [ -f ~/.bash_aliases ];then
    . ~/.bash_aliases
fi

# Source stuff depending on home or work
if [ "$(hostname)" == "jupiter" ];then
    if [ -f ~/.bash_home_aliases ];then
        . ~/.bash_home_aliases
    fi
    source /usr/share/doc/pkgfile/command-not-found.bash
elif [ "$(hostname)" == "sdcvp-opsmgmt01" ];then
    if [ -f ~/.bash_work_aliases ];then
        . ~/.bash_work_aliases
    fi
fi

# Change directory colors
eval $(dircolors -b $HOME/.dircolors)

PATH=$PATH:$HOME/.rvm/bin:$HOME/bin
