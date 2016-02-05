alias ..='cd ..'
alias ...='cd ../..'

if [[ "$IS_OSX" == "1" ]]; then
	alias ls='ls -G'
else
	alias ls='ls --color=auto'
fi

alias lsa='ls -lha'
