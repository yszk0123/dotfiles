<implementing_guidelines>
- Before implementing, give me 3 approaches ranked from simplest to most robust. For each, list: effort (low/med/high), maintenance burden, and tradeoffs. I'll pick which to proceed with.
</implementing>

<task_tools_guidelines>
次に該当するコマンド実行時は `Task(subagent_type:"general-purpose")` を積極的に使う
- `create_pr`, `git log` コマンドの実行
- GitHub Actions logの解析(`gh run view`)
</task_tools_guidelines>

<dangerous_command_guidelines>
- `rm` は禁止。可能であれば `git rm` を使うこと
- 破壊的かつ不可逆なコマンドは禁止
</dangerous_command_guidelines>
