
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
## This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: .zshenv, .zprofile, .zshrc, .zlogin

# Most of the complex bits are taken straight from the zsh documentation.
# Most of this from: http://ieee.uow.edu.au/documents/Unix_Guide/Unix_Guide/node70.html

#SHELL VARIABLES
#LANGUAGE=
#LC_ALL='en_IE.UTF-8'
#LANG='en_IE.UTF-8'
#LC_CTYPE=C

setopt ALL_EXPORT #all options subsequently defined are exported

#source /usr/local/bin/virtualenvwrapper.sh

#Disable Ctrl+S/Ctrl+Q freeze/resume
stty stop undef 

# Set up the file creation mask
umask 002


#--------------------------------------
#SHELL PARAMETERS {{{1
# Parameters (i.e. variables)
# No space before or after '='
#see zshparam for more


#
## mailpath array (don't need uppercase MAILPATH - see ZSH User Guide)
# If this doesn't work, set the $MAIL parameter to /var/mail/andmalc

PAGER='less -M'
EDITOR=vim
#PYTHONPATH='.'
export LESS=-cex3M


#----------------------------------------
#ZSH OPTIONS {{{1
# http://zsh.sunsite.dk/Doc/Release/zsh_15.html

#Defaults
#setopt AUTO_LIST AUTO_MENU AUTO_PARAM_SLASH

setopt CORRECT
setopt MENU_COMPLETE COMPLETE_IN_WORD LIST_PACKED
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NOCLOBBER
setopt NOBEEP
setopt AUTO_CD AUTO_PUSHD PUSHDIGNOREDUPS 
setopt AUTO_NAME_DIRS #Any parameter refering to an absolute path to a dir becomes a named dir: ~dir
setopt NOTIFY

## HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt SHARE_HISTORY INC_APPEND_HISTORY
#setopt HIST_IGNORE_SPACE
#setopt HIST_IGNORE_ALL_DUPS

# Key Bindings {{{1

# Emacs mode, overrides EDITOR=vi
bindkey -e 
bindkey '\ea' beginning-of-line

#bindkey -M menuselect '^o' accept-and-infer-next-history  # ^o completes dir in menu
# gathering multiple args with completion.  End each with 'Esc-CR'
#bindkey '\e^M' accept-and-menu-complete


#Prompt {{{1

#autoload -U promptinit
#promptinit

# Git prompt
# https://github.com/olivierverdier/zsh-git-prompt
#source ~/config/home/zsh/olivierverdier/zsh-git-prompt/zshrc.sh
#PROMPT='%B%m%~%b$(git_super_status) %# '


# Edit command line.  Bound to Ctrl X Ctrl E
#autoload -U edit-command-line
#zle -N edit-command-line
#bindkey '^x^e' edit-command-line

#autoload zmv

#Completion {{{1

#autoload -U compinit
#compinit

#setopt MENU_COMPLETE COMPLETE_IN_WORD LIST_PACKED
#zstyle ':completion:*' menu select=1
#autoload -U incrementaL-complete-word
#zle -N incrementaL-complete-word
#bindkey "^Xi" incrementaL-complete-word

# The following lines were added by compinstall

#zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#zstyle :compinstall filename '/home/andmalc/.zshrc'
#autoload -U compinit
#compinit
# End of lines added by compinstall

# Aliases {{{1
alias s='sudo'
alias aup='sudo aptitude update; sudo aptitude full-upgrade; sudo aptitude clean'
alias mkidr='mkdir -p'
alias hash="hash -r" #Clear cache of  executables - for newly installed programs

## aptitude {{{2
alias	ap='sudo aptitude'
alias	apu='sudo aptitude update'
alias	aps='aptitude search'
alias	apss='aptitude show'
alias	api='sudo aptitude -R install'

#apps {{{2
alias less='less -ir' # case insensivite searches, display raw control characters
alias -g L="| less"
alias -g G="| grep"
alias pgrep="pgrep -KILL -lf" #match against any part of command or process owner, list name also
alias pkill="pkill -KILL" #match against any part of command or process owner, list name also
alias pstree="pstree -hlGup"
alias -g xc='| xclip -selection clip-board'
alias dmesg='dmesg --ctime'
alias tree='tree -AC'
alias free='free -m' #size in Megabytes

#alias locations {{{2
alias -g nt='~/notes'    
alias du='du -h'
alias dus='du -ms .* | sort -n'
alias df='df -h'
alias ducks='du -kc * --max-depth=3 | sort -nr | head -10'


#list files {{{2
# List only directories and symbolic
# # links that point to directories
alias lsd='ls -ld *(-/DN)'
# # List only file beginning with "."
alias lsa='ls -ld .*'
## Nice view of directory tree
alias lsds='ls -AR' 
#moving around
alias -g '...'='../..'
alias -g '....'='../../..'
alias dirs='dirs -v'

alias ld='ls -l | grep "^d"' 
#or maybe ld='ls -ld */'
alias lm='ls -tl |  head -20'
alias ls='ls --color'
alias l='ls -lha'
alias ll='ls -aoh'
alias llg='ls -alh'

#Docker {{{2
alias drm="docker rm"
alias dps="docker ps"

