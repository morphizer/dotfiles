# Common aliases

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -la'
alias lld='ls -ld'
alias webs='python -m SimpleHTTPServer'
alias be='bundle exec'

alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(alert_helper)"'

# Fun aliases
alias persistclock="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-19));date;tput rc;done &"
