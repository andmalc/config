setopt ALL_EXPORT #all options subsequently defined are exported

#Nix package manager
#. /home/andmalc/.nix-profile/etc/profile.d/nix.sh

# Zsh env {{{1

#export TERM=xterm-256color

# ZSH function path
fpath=( "$HOME/.zfunctions" $fpath )

#fpath=($ZDOTDIR/completion $fpath)

# Shell env {{{1

# Words not split by special characters
WORDCHARS='/-.'

typeset -U PATH path 
path+=(~/.local/bin  )
#path+=(~/.local/bin  ~/dev/google-cloud-sdk/bin)

# UTF8 lang
LC_ALL=C.UTF-8
LANG=C.UTF-8

# Apps env {{{1
#
EDITOR=vim

# Less -F - do not paginate if less than a page
PAGER='less -F -M'
LESS=-cex3M


#For gnupg2
GPG_TTY=$(tty)

# Python {{{1

# Raw control chars - for IPython
# export PAGER='less -R'

# Location of IPython config and user data
IPYTHONDIR=~/.config/ipython

WORKON_HOME=~/Envs
PROJECT_HOME=$HOME/work
#source ~/.local/bin/virtualenvwrapper.sh

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py


#Google Cloud SDK {{{1



# vim: ft=zsh
