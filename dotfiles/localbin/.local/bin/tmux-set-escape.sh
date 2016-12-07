#!/bin/bash
if [[ -n $SSH_TTY ]];then
    tmux unbind-key C-b
    tmux  set -g prefix \`
    tmux bind \` send-prefix
    tmux set -g status-bg colour12
else
    tmux display-message "Not a ssh session";
fi
