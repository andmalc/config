if [ "$(tty)" = "/dev/tty1" ]; then
    export PATH=$PATH:~/bin
    export `gnome-keyring-daemon --start --components=ssh`
    exec sway > $XDG_RUNTIME_DIR/sway.log 2>&1
fi
