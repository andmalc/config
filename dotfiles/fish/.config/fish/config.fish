
set -U fish_user_paths /home/andmalc/.local/bin $fish_user_paths

set -gx CDPATH $CDPATH .  ~

set -g fisher_path ~/config/dotfiles/fish/.config/fish/fisher
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
#    builtin source $file 2> /dev/null
end

# length of directory abbreviations in prompt
set fish_prompt_pwd_dir_length 3

if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Neovim
set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket



if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations... 

  abbr g 'git'
  abbr ga 'git add'
  abbr gb 'git branch'
  abbr gbl 'git blame'
  abbr gc 'git commit -m'
  abbr gco 'git checkout'
  abbr gcp 'git cherry-pick'
  abbr gd 'git diff'
  abbr gf 'git fetch'
  abbr gl 'git log'
  abbr gm 'git merge'
  abbr gp 'git push'
  abbr gpl 'git pull'
  abbr gr 'git remote'
  abbr gs 'git status'
  abbr gst 'git stash'

  echo 'Done'
end

# https://github.com/arumoy-shome/dotfiles/blob/master/fish/functions/g.fish
function g
    if test "$argv"
        command git $argv
    else
        command git status
    end
end
