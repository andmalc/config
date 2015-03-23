export TERM=xterm-256color
export PAGER='less -M'
export EDITOR=vi
export LESS=-cex3M

PATH=$PATH:~/.local/bin:~/dev/google-cloud-sdk/bin

export DOCKER_HOST=tcp://coreos.malcolmson.ca:2375

export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/work
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

source ~/.local/bin/virtualenvwrapper.sh
#VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py


# vim: ft=zsh

