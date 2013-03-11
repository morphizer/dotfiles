# Common aliases

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -la'
alias lld='ls -ld'
alias webs='python -m SimpleHTTPServer'

# Fun aliases
alias persistclock="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-19));date;tput rc;done &"
