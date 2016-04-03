autoload -Uz vcs_info
autoload -Uz add-zsh-hook

if [ -s "$ZDOTDIR/zsh-git-prompt/zshrc.sh" ]; then
  source "$ZDOTDIR/zsh-git-prompt/zshrc.sh"
  ZSH_THEME_GIT_PROMPT_PREFIX="["
  ZSH_THEME_GIT_PROMPT_SUFFIX="]"

  function _vcs_info() {
    echo "$(git_super_status)"
  }
else
  zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
  zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'

  function _vcs_info() {
    LANG=en_US.UTF-8 vcs_info

    echo "${vcs_info_msg_0_}"
  }
fi

function _update_prompt() {
  PROMPT="%F{cyan}%~%f $(_vcs_info)
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
