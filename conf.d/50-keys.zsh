# Add some common key bindings
typeset -A key

# Ctrl + w only delete until slash
custom-backward-delete-word() {
	local WORDCHARS=${WORDCHARS/\//}
	zle backward-delete-word
}
zle -N custom-backward-delete-word
bindkey '^W' custom-backward-delete-word

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode

bindkey ";5C" forward-word
bindkey ";5D" backward-word
