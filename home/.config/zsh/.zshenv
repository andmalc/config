export TERM=xterm-256color

# Raw control chars - for IPython
export PAGER='less -R'
export EDITOR=vi
export LESS=-cex3M

PATH=~/.local/bin:$PATH:~/dev/google-cloud-sdk/bin:~/dev/android-sdk-linux/platform-tools

#export DOCKER_HOST=tcp://localhost:2375
#eval "$(docker-machine_linux-arm env home)"

# Location of IPython config and user data
export IPYTHONDIR=~/.config/ipython

export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/work
#source ~/.local/bin/virtualenvwrapper.sh

#PYTHONPATH='.'
#export PYTHONSTARTUP=~/admin/startup.py

#Google Cloud SDK
#source dev/google-cloud-sdk/path.zsh.inc 

fpath=($ZDOTDIR/completion $fpath)
autoload -Uz compinit && compinit -i


# vim: ft=zsh

