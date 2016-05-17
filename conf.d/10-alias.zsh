alias ..='cd ..'
alias ...='cd ../..'

# Allow using sudo with aliases
alias sudo='sudo '

if [[ "$IS_OSX" == "1" ]]; then
	alias ls='ls -G'
else
	alias ls='ls --color=auto'
fi

alias lsa='ls -lha'
