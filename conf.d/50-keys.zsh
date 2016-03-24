# Add some common key bindings
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
