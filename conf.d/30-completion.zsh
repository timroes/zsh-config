# Enable navigating in completions
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache 1

# Enable case insensitive auto completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Automatically autocomplete to first menu entry on tab
setopt MENU_COMPLETE
