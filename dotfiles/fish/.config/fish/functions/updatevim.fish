function updatevim
	set -lx SHELL (which sh)
    nvim +BundleInstall! +BundleClean +qall
end
