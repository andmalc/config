
PATH=$PATH:~/.local/bin:~/dev/android-sdk-linux/platform-tools
source ~/.pythonbrew/etc/bashrc

#PATH=$PATH:~/Dropbox/admin/todo
#export PYTHONSTARTUP=~/admin/startup.py

export PIP_DOWNLOAD_CACHE=$HOME/.pip-download-cache

#export VIRTUALENV_USE_DISTRIBUTE
#export PIP_REQUIRE_VIRTUALENV=true
#export PIP_RESPECT_VIRTUALENV=true
#export WORKON_HOME=$HOME/.virtualenvs
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
#export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
#export VIRTUALENVWRAPPER_LOG__DIR=$WORKON_HOME
#source ~/.local/bin/virtualenv-sh.zsh
source ~/.local/bin/virtualenvwrapper.sh

export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_LOG_DIR="$WORKON_HOME"
export VIRTUALENVWRAPPER_HOOK_DIR="$WORKON_HOME"
#source ~/.local/bin/virtualenvwrapper.sh
#source $PATH_PYTHONBREW_CURRENT/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true


# vim: ft=zsh
