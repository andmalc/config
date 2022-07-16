
# length of directory abbreviations in prompt
set fish_prompt_pwd_dir_length 3

# Shell Variables

# prevent CDPATH from being read by shell scripts
if status --is-interactive
	set CDPATH ~/config ~/notes $CDPATH
end

# Environment Variables
#
set -x EDITOR nvim
set -x LESS "--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --window=-4"

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
#set -x XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share /var/lib/flatpak/exports/share

# PATH
# Changes $fish_user_paths
# Default is -U 
# fish_add_path "$HOME/.local/bin"



# Abbreiations
# Consider adding with -U so saved in fish_variables instead
abbr --add --global v nvim
abbr --add --global s sudo
abbr --add --global l less
abbr --add --global la ls -la
abbr --add --global gco git checkout
abbr --add --global g 'git'
abbr --add --global ga 'git add'
abbr --add --global gb 'git branch'
abbr --add --global gbl 'git blame'
abbr --add --global gc 'git commit -m'
abbr --add --global gco 'git checkout'
abbr --add --global gd 'git diff'
abbr --add --global glp 'git log  --decorate --graph --oneline --all'
abbr --add --global gp 'git push'
abbr --add --global gpl 'git pull'
abbr --add --global gs 'git status'


# Bindings
# Here or add to fish_key_bindings function?
# bind \x7F 'backward-kill-bigword'

# Ctrl H = backspace
bind \b backward-delete-char

# Neovim
#set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket

# Ripgrep
set -x RIPGREP_CONFIG_PATH ~/.config/rg

# Plugins
#
# Fisher to install to .local/share/fisher
set -g fisher_path ~/.local/share/fisher

#for file in $fisher_path/conf.d/*.fish
#    builtin source $file 2> /dev/null
#end

