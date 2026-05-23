# if is_exists 'stty'; then
#   # Prevent a terminal from freeze when inputting Ctrl-s
#   # cf. [In vim how to map "save" to ctrl-s - Stack Overflow](http://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s)
#   stty -ixon
# fi

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# vim:set ft=zsh:
