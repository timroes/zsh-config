# If pacman is installed add some shortcuts via a pacwrap function.

type pacman > /dev/null 2>&1
if [ $? -eq 0 ]; then

	pacwrap() {
		case "$1" in
			cleanup)
				shift
				orphans=$(pacman -Qqtd)
				if [ -z "$orphans" ]; then
					echo "No orphans found. Nothing to cleanup."
				else
					command sudo pacman -Rns $(pacman -Qqtd)
				fi
				;;
			*)
				echo "No command specified."
				;;
		esac
	}

fi
