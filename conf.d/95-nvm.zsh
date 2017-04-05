check_node_version() {
	# When a .node-version file in the current directory exists ..
	if [[ "$IGNORE_NODE_VERSION" != "1" && -f ".node-version" ]]; then
		nodeVersion=`cat .node-version`
		# .. check whether the current node version is the required one
		if [ `node -v` != "v$nodeVersion" ]; then
			# If not use nvm to set the version to the one from .node-version
			echo -e "$fg_bold[yellow]Found .node-version file!$reset_color Switching to node v$nodeVersion ..."
			nvm install $nodeVersion
			if [ $? -eq 0 ]; then
				echo -e "$fg_bold[green]Done!$reset_color"
			else
				echo -e "$fg_bold[red]Failed!$reset_color"
			fi
		fi
	fi
}

if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use

	# Check whether nvm is installed successfully
	type nvm > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		# If nvm was installed successfully setup the check for a .node-version file
		add-zsh-hook precmd check_node_version

		alias node='unalias node ; unalias npm ; nvm use default ; node $@'
		alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'
	fi
fi
