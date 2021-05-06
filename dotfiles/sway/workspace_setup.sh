#!/bin/sh
set -eux

TERM="$1"

# let kanshi start up and reconfigure outputs
sleep 3

swaymsg workspace 3
$TERM &
gtimelog &

sleep 2
swaymsg workspace 2
#firefox-wayland &

sleep 5
swaymsg workspace 1

# start IRC during work hours
if [ `date +%u` -lt 6 ] && [ `date +%k` -ge 5 ] && [ `date +%k` -lt 18 ]; then
    $TERM -title "WeeChat" -fn "monospace 7.5" -e env TERM=xterm weechat
fi

sleep 1
swaymsg splitv
$TERM
sleep 0.5
swaymsg move up
swaymsg resize set height 80ppt
swaymsg splith
$TERM
sleep 0.5
swaymsg resize set width 40ppt

disown
