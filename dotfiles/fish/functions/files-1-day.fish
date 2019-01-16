# Defined in - @ line 0
function files-1-day --description 'alias files-1-day=find . -mtime 0'
	find . -mtime 0 $argv;
end
