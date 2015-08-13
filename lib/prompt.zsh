autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'
 
function _update_prompt() {
  LANG=en_US.UTF-8 vcs_info

  PROMPT="%F{cyan}%~%f ${vcs_info_msg_0_}
%F{cyan}$%f "

  # プロンプトの幅が十分広ければホスト名など追加情報を表示
  if [ $COLUMNS -gt 80 ]; then
    RPROMPT='%F{yellow}%n@%M%f'
  else
    RPROMPT=''
  fi
}
add-zsh-hook precmd _update_prompt

# vim:set ft=zsh:
