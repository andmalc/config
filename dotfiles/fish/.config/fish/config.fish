
set -gx CDPATH $CDPATH .  ~

#set -g fisher_path ~/config/dotfiles/fish/.config/fish/fisher
#set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
#set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

#for file in $fisher_path/conf.d/*.fish
#    builtin source $file 2> /dev/null
#end

# length of directory abbreviations in prompt
set fish_prompt_pwd_dir_length 3

if status --is-interactive
    #    set BASE16_SHELL "$HOME/.config/base16-shell/"
    #source "$BASE16_SHELL/profile_helper.fish"
end

# Neovim
set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket



if status --is-interactive
  abbr --add --global gco git checkout
  abbr --add --global g 'git'
  abbr --add --global ga 'git add'
  abbr --add --global gb 'git branch'
  abbr --add --global gbl 'git blame'
  abbr --add --global gc 'git commit -m'
  abbr --add --global gco 'git checkout'
  abbr --add --global gd 'git diff'
  abbr --add --global gp 'git push'
  abbr --add --global gpl 'git pull'
  abbr --add --global gs 'git status'
end

