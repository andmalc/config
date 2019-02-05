# Defined in /tmp/fish.f20rf3/search_preview.fish @ line 1
function search_preview --description 'find with fd, select and preview with fzf'
	fdfind $argv | fzf --preview 'cat {}'
end
