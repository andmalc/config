export TERM=xterm-256color
export PAGER='less -M'
export EDITOR=vi
export LESS=-cex3M

PATH=$PATH:~/.local/bin:~/dev/google-cloud-sdk/bin

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py

export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/work
#export PIP_DOWNLOAD_CACHE=$HOME/.pip-download-cache
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

#source /usr/local/bin/virtualenvwrapper.sh
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
#VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source ~/.local/bin/virtualenvwrapper.sh

# vim: ft=zsh

