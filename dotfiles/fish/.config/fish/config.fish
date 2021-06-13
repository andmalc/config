
set -gx CDPATH $CDPATH .  ~

# length of directory abbreviations in prompt
set fish_prompt_pwd_dir_length 3


if test -e ~/.secrets.fish
    #    source ~/.secrets.fish
end

# Variables
#
set -x XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share /var/lib/flatpak/exports/share
set --prepend PATH "$HOME/.local/bin"
set -x EDITOR nvim
set -x LESS "--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --window=-4"

#set -x RIPGREP_CONFIG_PATH ~/.config/rg

# Abbreiations
# Neovim
#set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket


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
abbr --add --global glp 'git log --pretty=oneline'
abbr --add --global gp 'git push'
abbr --add --global gpl 'git pull'
abbr --add --global gs 'git status'

# Plugins
#
#
#set -g fisher_path ~/config/dotfiles/fish/.config/fish/fisher
#set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
#set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

#for file in $fisher_path/conf.d/*.fish
#    builtin source $file 2> /dev/null
#end

