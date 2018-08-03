source ~/config/term/antigen/antigen.zsh
source ~/config/dotfiles/zsh/antigenrc

# GPG & SSH agents {{{1
# http://ryanlue.com/posts/2017-06-29-gpg-for-ssh-auth
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#DISABLED
# On remote, tmux not running
#if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && [ -z "$TMUX" ]; then
    #mux default
#   tmux attach
# On local, tmux not running
#elif [ -z "$SSH_CLIENT" ] || [ -z "$SSH_TTY" ] && [ -z "$TMUX" ]; then
#    ssh-add ~/.ssh/andmalc
#    ssh-add ~/.ssh/id_ed25519
#else
#fi


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

# Other {{{1

#Autojump {{{1
#
. /usr/share/autojump/autojump.sh

# FZF {{{1
# FZF source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Google Cloud Shell {{{1



# Zsh completion
if [[ -e "/google/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "/google/google-cloud-sdk/completion.zsh.inc"
fi

# Cloud Shell
if [[ -e "/google/google-cloud-sdk/path.zsh.inc" ]]; then
    source "/google/google-cloud-sdk/path.zsh.inc"
fi

# Cloud Shell prompt and exit script
if [[ $CLOUD_SHELL ]]; then
    #exec /usr/bin/zsh

    #setopt promptsubst
    #PROMPT='%n@${DEVSHELL_PROJECT_ID:-cloudshell}:%~ %(!.#.Z) '

    onexit () {
      for FILE in /google/devshell/bash_exit.google.d/*; do
        if [ -x "$FILE" ]; then
          "$FILE"
        fi
      done
    }
    trap onexit EXIT
fi
