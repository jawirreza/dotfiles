#!/usr/bin/env sh

## Executed by startx (run your window manager from here)
xrdb -load ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash

if [ -d /etc/X11/xinit/xinitrc.d  ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f"  ] && . "$f"
  done
  unset f
fi

# Load .xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Untuk SLiM Session
DEFAULTSESSION=i3-with-shmlog
case "$1" in
    awesome) exec awesome ;;
    dwm) exec dwm ;;
    i3) exec i3 ;;
    i3-with-shmlog) exec i3-with-shmlog ;;
    sway) exec sway ;;
    *) exec $DEFAULTSESSION ;;
esac

