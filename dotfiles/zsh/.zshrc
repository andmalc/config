
# Plugins {{{1

source ~/config/term/antigen/antigen.zsh
antigen use oh-my-zsh

# Required by ssh-agent plugin
#zstyle :omz:plugins:ssh-agent agent-forwarding on
 
antigen bundles <<EOBUNDLES

# Aliases: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#aliases-1
#tmux

# Linux plugins {{{2
#dnf
#ssh-agent
#systemd # Add sc-[command] aliases to all systemctl commands, using sudo when needed.
sudo # ESC twice: Puts sudo in front of the current command, or the last one if the command line is empty.

# Prog plugins {{{2
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
# virtualenvwrapper # Loads virtualenvwrapper shell tools, activates virtualenv on cd into git repository with matching name.  
git

# Shell plugins {{{2
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions

EOBUNDLES

# Themes {{{2
#antigen-theme fox
#antigen-theme /home/andmalc/config/term/ af-magic
antigen-theme robbyrussell

antigen apply

# zsh Parameters {{{1

# Parameters (i.e. variables)
# No space before or after '='
#see zshparam for more

# HISTORY {{{1

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

#Shell Variables {{{1
 
#Disable Ctrl+S/Ctrl+Q freeze/resume
stty stop undef 

# Set up the file creation mask
umask 002


#Zsh Options {{{1
# http://zsh.sunsite.dk/Doc/Release/zsh_15.html

autoload -U select-word-style
select-word-style shell

#Defaults
setopt CORRECT
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NOCLOBBER
setopt NOBEEP
setopt AUTO_CD AUTO_PUSHD PUSHDIGNOREDUPS 
setopt AUTO_NAME_DIRS #Any parameter refering to an absolute path to a dir becomes a named dir: ~dir
setopt NOTIFY

unset zle_bracketed_paste

#Key Bindings {{{1

# Emacs mode, overrides EDITOR=vi
#bindkey -e 
#bindkey '\ea' beginning-of-line

#bindkey -M menuselect '^o' accept-and-infer-next-history  # ^o completes dir in menu
# gathering multiple args with completion.  End each with 'Esc-CR'
#bindkey '\e^M' accept-and-menu-complete

# Alt+ arrow for word forward/back.  Ctrl+arrows works already
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

#Prompt {{{1

## %~ is short (/home > ~) form of current dir
# %m short hostname, %M full host name, %n is $USERNAME
#PROMPT='%/> '
# RPROMPT="[%T]"
# Set the prompt to "[bold{user@host}]relative_working_directory$ "
# PS1="[%B%n@%m%b]%~$ "

#autoload -U promptinit
#promptinit

#prompt oliver



#Completion {{{1

setopt MENU_COMPLETE COMPLETE_IN_WORD LIST_PACKED

# loading of compinit handled by OMZ
#autoload -U compinit
#compinit
# The following lines were added by compinstall

#zstyle ':completion:*' menu select=1
#autoload -U incrementaL-complete-word
#zle -N incrementaL-complete-word
#bindkey "^Xi" incrementaL-complete-word
#zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#zstyle :compinstall filename '/home/andmalc/.zshrc'
#autoload -U compinit
#compinit
# End of lines added by compinstall

#Aliases {{{1
alias s='sudo'
alias aup='sudo aptitude update; sudo aptitude full-upgrade; sudo aptitude clean'
alias mkidr='mkdir -p'
alias hash="hash -r" #Clear cache of  executables - for newly installed programs

#aptitude {{{2
alias	ap='sudo aptitude'
alias	apu='sudo aptitude update'
alias	aps='aptitude search'
alias	apss='aptitude show'
alias	api='sudo aptitude -R install'

#apps {{{2
alias less='less -ir' # case insensivite searches, display raw control characters
alias -g L="| less"
alias -g G="| grep -i"
alias pgrep="pgrep  -lf" #match against any part of command or process owner, list name also
alias pkill="pkill -KILL" #match against any part of command or process owner, list name also
alias pstree="pstree -hlGup"
alias -g xc='| xclip -selection clip-board'
alias dmesg='dmesg --ctime'
alias tree='tree -AC'
alias free='free -m' #size in Megabytes
alias xclip='xclip -selection c' #xclip to CLIPBOARD buffer not PRIMARY

# Tmux UTF-8 support
#alias tmux='tmux -u'

#alias locations {{{2
alias -g nt='~/notes'    
alias du='du -h'
alias dus='du -ms .* | sort -n'
alias df='df -h'
alias ducks='du -kc * --max-depth=3 --threshold=500M | sort -nr | head -10'


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

#   alias ld='ls -l | grep "^d"' 
#or maybe ld='ls -ld */'
alias lm='ls -tl |  head -20'
alias ls='ls --color'
alias l='ls -lha'
alias ll='ls -aoh'
alias llg='ls -alh'

# Show types, hidden but not ./.., in columns
alias la='ls -AFC'

# Buildah
alias bd='sudo buildah'
alias bdi='sudo buildah images'
alias bdc='sudo buildah containers'
alias bdr='sudo buildah run'
alias bdf='sudo buildah from'

#Docker {{{2
alias drm="docker rm"
alias dps="docker ps"

#DNF {{{2
#alias di="sudo dnf install "
#alias da="sudo dnf list available "
#alias dup="sudo dnf update "

#systemctl {{{2
alias sclua='systemctl list-units --all ' 

# Tilix config {{{1
# fix for Tilix 
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#Base16 config {{{1
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
