# Defined in - @ line 2
function search_preview --description 'find with fd, select and preview with fzf'
	find $argv | fzf --preview 'cat {}'
end
