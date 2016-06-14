# If pacman is installed add some shortcuts via a pacwrap function.

type pacman > /dev/null 2>&1
if [ $? -eq 0 ]; then

	pacwrap() {
		case "$1" in
			update)
				shift
				command sudo pacman -Syy $@
				;;
			upgrade)
				shift
				type pacaur > /dev/null 2>&1
				if [ $? -eq 0 ]; then
					command pacaur -Syu
				else
					command sudo pacman -Syu
				fi
				;;
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
