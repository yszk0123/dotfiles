#!/bin/bash -e
# See: https://zenn.dev/yuru_log/articles/claude-code-hooks-terminal-notifier-guide

COMMAND=$(jq -r '.tool_input.command // ""')
if echo "$COMMAND" | grep -E "(rm -rf|sudo|passwd)" >/dev/null; then
  osascript -e "display notification \"危険なコマンドが実行されようとしています: $COMMAND\" \
    with title \"Claude Code\" \
    sound name \"Sosumi\""
  echo "危険なコマンドが検出されました: $COMMAND" >&2
  exit 2
fi

FILE_PATH=$(jq -r '.tool_input.file_path // ""')
if echo "$FILE_PATH" | grep -E "(\.env|\.git|\.ssh)" >/dev/null; then
  osascript -e "display notification \"機密ファイルへのアクセスは禁止されています: $FILE_PATH\" \
    with title \"Claude Code\" \
    sound name \"Sosumi\""
  echo "危険なファイルアクセスが検出されました: $FILE_PATH" >&2
  exit 2
fi
