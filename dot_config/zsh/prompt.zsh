# Pure prompt configuration
# https://github.com/sindresorhus/pure
PURE_PROMPT_SYMBOL='❯'
PURE_CMD_MAX_EXEC_TIME=1
PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=1
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red

# RPROMPT supplement - language versions cached per directory, time always shown
typeset -g _prompt_cached_dir=""
typeset -g _prompt_cached_langs=""

_prompt_supplement_precmd() {
  local parts=("%F{242}%D{%T}%f")

  if [[ "$PWD" != "$_prompt_cached_dir" ]]; then
    _prompt_cached_dir="$PWD"
    local lang_parts=()
    [[ -f package.json || -f .node-version ]] && (( $+commands[node] )) && \
      lang_parts+=("%F{green}⬢ $(node -v 2>/dev/null)%f")
    [[ -f pyproject.toml || -f .python-version || -n "$VIRTUAL_ENV" ]] && (( $+commands[python3] )) && \
      lang_parts+=("%F{yellow}🐍 $(python3 -V 2>/dev/null | cut -d' ' -f2)%f")
    [[ -f Cargo.toml ]] && (( $+commands[rustc] )) && \
      lang_parts+=("%F{red}🦀 $(rustc -V 2>/dev/null | cut -d' ' -f2)%f")
    [[ -f go.mod ]] && (( $+commands[go] )) && \
      lang_parts+=("%F{cyan}🐹 $(go version 2>/dev/null | cut -d' ' -f3 | sed 's/go//')%f")
    _prompt_cached_langs="${(j: :)lang_parts}"
  fi

  [[ -n "$_prompt_cached_langs" ]] && parts+=("$_prompt_cached_langs")
  RPROMPT="${(j: :)parts}"
}
