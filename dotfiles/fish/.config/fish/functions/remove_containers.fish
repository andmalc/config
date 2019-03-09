# Defined in - @ line 1
function remove_containers --description 'Remove containers.  $type is buildah or podman' --argument type
	switch $type
        case buildah
            for c in (buildah ps -q --all)
                buildah rm $c
            end
        case podman
            for c in (podman ps -q -all)
                podman rm $c
            end
    end
end
