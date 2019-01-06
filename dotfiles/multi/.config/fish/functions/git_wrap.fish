
# https://github.com/arumoy-shome/dotfiles/blob/master/fish/functions/g.fish

function g
    if test "$argv"
        command git $argv
    else
        command git status
    end
end
