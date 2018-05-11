# Enable navigating in completions
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache 1

# Enable case insensitive auto completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Automatically autocomplete to first menu entry on tab
setopt MENU_COMPLETE

# Enable autocompletion of directories and auto change without a command
setopt autocd
# Setup some paths that will automatically tried to be cd'ed into when completing folders
cdpath=($HOME/elastic)


include_autosuggest=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ -a "$include_autosuggest" ]]; then
	ZSH_AUTOSUGGEST_USE_ASYNC=true
	source $include_autosuggest
else
	echo "You might want to install zsh-autosuggestions from AUR for proper autocompletion."
fi
