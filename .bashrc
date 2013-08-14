# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ];then
	. /etc/bashrc
fi

EDITOR="vim"

# History settings
shopt -s histappend
HISTCONTROL=ignoreboth #ignoredups and ignorespace
HISTFILE="${HOME}/.bash_history.$(hostname)"
HISTIGNORE="pwd:ls:ls -l:ls -la:ls -ltr:history"
HISTTIMEFORMAT='%F %T '
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

# Make sure there is a folder available for ssh control sessions
if [ ! -d "~/.ssh/control" ];then
    mkdir -p ~/.ssh/control
fi

# Prompt
function _prompt_command() {
    local EXIT="$?"

    local Clear='\[\e[0m\]'
    local LightBlue='\[\e[36m\]'
    local Yellow='\[\e[33m\]'
    local Red='\[\e[31m\]'
    local Green='\[\e[32m\]'

    if [ $EXIT != 0 ]; then
        local face="${Red}:(${Clear}"
    else
        local face="${Green}:)${Clear}"
    fi

    local branch=$(git symbolic-ref HEAD 2> /dev/null)
    local branch="${Yellow}${branch#refs/heads/}"

	echo -n "${b#refs/heads/}"
    history -a 
    history -c 
    history -r
    
    PS1="\u@${Yellow}\h${Clear}:${LightBlue}[\w]${Clear} ${branch} ${face} \$ "
}
export PROMPT_COMMAND=_prompt_command
export PROMPT_DIRTRIM=3

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
elif [ "$(hostname)" == "aharley-MacBookPro" ];then
    if [ -f ~/.bash_work_aliases ];then
        . ~/.bash_work_aliases
    fi
fi

# Add AWS command completion
if [ -x $(which aws_completer) ];then
  complete -C aws_completer aws
fi

# Change directory colors
eval $(dircolors -b $HOME/.dircolors)


### Added by rvm
PATH=$PATH:$HOME/.rvm/bin:$HOME/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
