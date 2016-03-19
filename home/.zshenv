export TERM=xterm-256color

#For gnupg2
GPG_TTY=$(tty)
export GPG_TTY

# Raw control chars - for IPython
export PAGER='less -R'
export EDITOR=vi
export LESS=-cex3M

#PATH=~/.local/bin:PATH:~/dev/google-cloud-sdk/bin
typeset -U PATH path 
path+=(~/.local/bin)
#path+=(~/.local/bin:PATH ~/dev/google-cloud-sdk/bin)

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


# The next line updates PATH for the Google Cloud SDK.
#source '/home/andmalc/dev/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
#source '/home/andmalc/dev/google-cloud-sdk/completion.zsh.inc'
