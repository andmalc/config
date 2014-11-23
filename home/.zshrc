
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

##PROMPT parameter
## %~ is short (/home > ~) form of current dir
# %m short hostname, %M full host name, %n is $USERNAME
#PROMPT='%/> '
RPROMPT="[%T]"
# Set the prompt to "[bold{user@host}]relative_working_directory$ "
PS1="[%B%n@%m%b]%~$ "

#----------------------------------------
# SHELL CONFIG COMMANDS {{{1


# Set up the file creation mask
umask 002

# Read .dircolors file 
# eval `dircolors .dircolors`

# Key Bindings {{{1

# Emacs mode, overrides EDITOR=vi
bindkey -e 
bindkey '\ea' beginning-of-line

#bindkey -M menuselect '^o' accept-and-infer-next-history  # ^o completes dir in menu
# gathering multiple args with completion.  End each with 'Esc-CR'
#bindkey '\e^M' accept-and-menu-complete


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

#ZSH CONFIG COMMANDS {{{1
#autoload -U compinit
#compinit -C #don't perform security check

autoload -U promptinit
promptinit
prompt oliver

#autoload -U predict-on
#predict-on

setopt MENU_COMPLETE COMPLETE_IN_WORD LIST_PACKED
#zstyle ':completion:*' menu select=1
#autoload -U incrementaL-complete-word
#zle -N incrementaL-complete-word
#bindkey "^Xi" incrementaL-complete-word

# Git completion - http://felipec.wordpress.com/2013/07/31/how-i-fixed-git-zsh-completion/
fpath=(~/.zsh $fpath)

autoload -U insert-files
zle -N insert-files
bindkey "^Xf" insert-files

# Edit command line.  Bound to Ctrl X Ctrl E
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

autoload zmv

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/andmalc/.zshrc'

autoload -U compinit
compinit
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

