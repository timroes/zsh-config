check_node_version() {
	# When a .nvmrc file in the current directory exists ..
	if [[ "$IGNORE_NODE_VERSION" != "1" && -f ".nvmrc" ]]; then
		nodeVersion=`cat .nvmrc`
		# .. check whether the current node version is the required one
		if [ `node -v` != "v$nodeVersion" ]; then
			# If not use nvm to set the version to the one from .node-version
			echo -e "$fg_bold[yellow]Found .nvmrc file!$reset_color Switching to node v$nodeVersion ..."
			nvm ls $nodeVersion &> /dev/null
			if [ $? -eq 0 ]; then
				nvm use $nodeVersion
			else
				nvm install $nodeVersion
			fi
			if [ $? -eq 0 ]; then
				echo -e "$fg_bold[green]Done!$reset_color"
			else
				echo -e "$fg_bold[red]Failed!$reset_color"
			fi
		fi
	fi
}

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
	source /usr/share/nvm/init-nvm.sh
	add-zsh-hook precmd check_node_version
fi
