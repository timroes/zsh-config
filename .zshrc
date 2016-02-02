# Get real path of this directory
ZSHDIR="$(dirname $(realpath ${(%):-%N}))"

autoload -U  compinit  promptinit
compinit
promptinit; prompt gentoo

# Include all modules from modules.d directory (this is also only a config
# but meant to only contain functions)
for module in $ZSHDIR/modules.d/*.zsh; do
	source "$module"
done


# Include all configurations from conf.d directory
for conf in $ZSHDIR/conf.d/*.zsh; do
	source "$conf"
done
