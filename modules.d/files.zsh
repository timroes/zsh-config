function first_existing() {
	for file in "$@"; do
		if [ -f "$file" ]; then
			echo "$file"
			return
		fi
	done
}

function first_dir() {
	for dir in "$@"; do
		if [ -d "$dir" ]; then
			echo "$dir"
			return
		fi
	done
}
