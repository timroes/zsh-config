#! /bin/bash

FILES=(.zshenv .zprofile .zshrc .zlogin .zlogout .gitconfig)

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null

if [ -e "$HOME/.zshenv" ] || [ -e "$HOME/.zprofile" ] || [ -e "$HOME/.zshrc" ] || [ -e "$HOME/.zlogin" ] || [ -e "$HOME/.zlogout" ]; then
	echo "There already exist some zsh configs in the home directory. Remove this and execute the script again."
	exit 1
fi

for config in ${FILES[@]}; do
	ln -sf "$SCRIPTPATH/$config" "$HOME"
done
