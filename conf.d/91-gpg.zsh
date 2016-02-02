if [ -f "$HOME/.gnupg/gpg-agent.env" ]; then
	source $HOME/.gnupg/gpg-agent.env
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
	export SSH_AGENT_PID
fi
