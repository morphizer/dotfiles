#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Some fonts are in a different directory, allow their use in X
xset +fp /usr/share/fonts/local
xset fp rehash

# Disable screen timeouts
xset -dpms

# Turn on numlock
numlockx &

# Random wallpaper rotation
set_wallpaper.sh &

# Set Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start awesome
exec awesome
