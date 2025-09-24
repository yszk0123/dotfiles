---
description: 'プルリクエストを作成する'
---

# プルリクエスト作成

以下の手順でプルリクエストを作成してください：

## 手順

1. ブランチ確認・作成
   - 現在のブランチが main/master/develop の場合、新規ブランチを作成
   - ブランチ名は変更内容を端的に表現する
2. 変更をステージング・コミット
   - 変更ファイルを `git add` でステージング
   - Conventional Commits 規約に従ってコミット作成
   - Claude Code 署名を含めてコミット
3. プッシュ・プルリクエスト作成
   - GitHub にブランチをプッシュ
   - `gh pr create` でプルリクエスト作成

## PR テンプレート

プルリクエストの body には以下のテンプレートを使用：

```
## 概要

（変更内容の概要を箇条書きで記載）

## References

（関連するリンクをリストで記載）
```

## コミットメッセージ規約

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) に従い、以下の形式を使用：

- `feat: 新機能追加` JavaScript, TypeScript ファイルが関連する場合のみ使用する
- `fix: バグ修正` JavaScript, TypeScript ファイルが関連する場合のみ使用する
- `test: テスト追加・修正` JavaScript, TypeScript ファイルが関連する場合のみ使用する
- `docs: ドキュメント更新`
- `style: コードフォーマット`
- `refactor: リファクタリング`
- `chore: その他の変更`
- `build: ビルド関連`
- `ci: GitHub Actions 関連`

## 実行例

```bash
# 新規ブランチ作成（main/master/develop の場合）
git checkout -b feat/add-new-endpoint

# 変更をステージング・コミット
git add .
git commit -m "feat: add new API endpoint"

# プッシュ・PR作成
git push -u origin feat/add-new-endpoint
gh pr create --title "feat: add new API endpoint" --assignee @me --body "$(cat <<'EOF'## 概要

- 新しいAPI エンドポイントを追加
- バリデーション機能を実装

## References

- Issue #123

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
