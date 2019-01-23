# Defined in /tmp/fish.jbpkcb/clean_pip.fish @ line 2
function clean_pip --description 'Uninstall local pip pkgs'
	set pkgs (python3 -m pip freeze --user )
    for p in $pkgs
         python3 -m pip uninstall (string match -r "[[:alpha:]-]+" $p)
     end
end
