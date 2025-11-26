---
description: '変更をコミットする'
---

# コミット作成

以下の手順で変更をコミットしてください：

## 手順

1. 変更状況確認
   - `git status` で変更ファイルを確認
   - `git diff` で変更内容を確認
2. ステージング
   - 関連するファイルを `git add` を使いファイルパス指定でステージング
   - 1コミットには1種類の変更のみを含めること
3. コミット作成
   - Conventional Commits 規約に従ってコミットメッセージを作成
   - Claude Code 署名を含めてコミット
   - 1コミットには1種類の変更を含めること
4. クリーンになるまで2~3を繰り返す

## コミットメッセージ規約

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) に従い、以下の形式を使用：

- `feat: 新機能追加` 実装ファイルが関連する場合のみ使用する
- `fix: バグ修正` 実装ファイルが関連する場合のみ使用する
- `test: テスト追加・修正` テスト関連ファイルが関連する場合のみ使用する
- `docs: ドキュメント更新`
- `style: コードフォーマット`
- `refactor: リファクタリング`
- `chore: その他の変更`
- `build: ビルド関連`
- `ci: GitHub Actions 関連`

## コミットテンプレート

```
<type>: <description>

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## 実行例

```bash
# 変更状況確認
git status
git diff

# ファイルをステージング
git add src/main.ts
git add docs/README.md

# コミット作成
git commit -m "$(cat <<'EOF'
feat: add new API endpoint

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

## 注意事項

- コミットメッセージは変更内容を簡潔に表現する
- 複数の変更種別がある場合は、主要な変更に合わせてコミットメッセージを作成
- Claude Code 署名 (Co-Authored-By) を commit message と pull-request body に必ず含める
- 機密情報は絶対にコミットしない
