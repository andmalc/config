export TERM=xterm-256color

# Raw control chars - for IPython
export PAGER='less -R'
export EDITOR=vi
export LESS=-cex3M

PATH=~/.local/bin:$PATH:~/dev/google-cloud-sdk/bin

#VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/work
source ~/.local/bin/virtualenvwrapper.sh

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py

#Google Cloud SDK
source dev/google-cloud-sdk/path.zsh.inc 


# vim: ft=zsh

