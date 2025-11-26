#!/bin/bash
# See: https://zenn.dev/yuru_log/articles/claude-code-hooks-terminal-notifier-guide

# 入力データから情報を取得
SESSION_ID=$(jq -r '.session_id')
STOP_HOOK_ACTIVE=$(jq -r '.stop_hook_active')

# 無限ループを防ぐ
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
  exit 0
fi

# プロジェクト名を取得
PROJECT_NAME=$(basename "$PWD")

# 詳細な通知を送信
osascript -e "display notification \
    \"コマンドの実行確認が必要です\\nSession: ${SESSION_ID:0:8}\\nProject: $PROJECT_NAME\" \
    with title \"Claude Code\" \
    sound name \"Blow\""
