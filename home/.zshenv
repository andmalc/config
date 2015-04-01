export TERM=xterm-256color

# Raw control chars - for IPython
export PAGER='less -R'
export EDITOR=vi
export LESS=-cex3M

PATH=~/.local/bin:$PATH:~/dev/google-cloud-sdk/bin

export DOCKER_HOST=tcp://home.malcolmson.ca:2375
#export DOCKER_HOST=tcp://coreos.malcolmson.ca:2375

export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/work
source ~/.local/bin/virtualenvwrapper.sh

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py

#Google Cloud SDK
#source ~/dev/google-cloud-sdk/path.zsh.inc 


# vim: ft=zsh

