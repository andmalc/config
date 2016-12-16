setopt ALL_EXPORT #all options subsequently defined are exported

# Zsh env {{{1
#export TERM=xterm-256color

# ZSH function path
fpath=( "$HOME/.zfunctions" $fpath )

#fpath=($ZDOTDIR/completion $fpath)

# Words not split by special characters
export WORDCHARS='/-.'

# Shell env {{{1

typeset -U PATH path 
path+=(~/.local/bin ~/dev/google-cloud-sdk/bin)

# Apps env {{{1
#
export EDITOR=vim
PAGER='less -M'
export LESS=-cex3M

# Raw control chars - for IPython
# export PAGER='less -R'

# Location of IPython config and user data
export IPYTHONDIR=~/.config/ipython

export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/work
#source ~/.local/bin/virtualenvwrapper.sh

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py

#For gnupg2
GPG_TTY=$(tty)
export GPG_TTY


#Google Cloud SDK
#source dev/google-cloud-sdk/path.zsh.inc 

# The next line updates PATH for the Google Cloud SDK.
#source '/home/andmalc/dev/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
#source '/home/andmalc/dev/google-cloud-sdk/completion.zsh.inc'

# vim: ft=zsh
