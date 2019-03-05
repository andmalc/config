
set -U fish_user_paths /home/andmalc/.local/bin $fish_user_paths

set -gx CDPATH $CDPATH .  ~

# Neovim
set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket

#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#    source "$BASE16_SHELL/profile_helper.fish"
#end

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

