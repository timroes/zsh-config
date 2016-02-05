# Get real path of this directory
ZSHDIR="$(dirname $(readlink ${(%):-%N}))"

autoload -U compinit
compinit

# Check whether we are running on an OSX system and set IS_OSX variable
if [[ "$(uname)" == "Darwin" ]]; then
	IS_OSX=1
else
	IS_OSX=0
fi

# Include all modules from modules.d directory (this is also only a config
# but meant to only contain functions)
for module in $ZSHDIR/modules.d/*.zsh; do
	source "$module"
done


# Include all configurations from conf.d directory
for conf in $ZSHDIR/conf.d/*.zsh; do
	source "$conf"
done
