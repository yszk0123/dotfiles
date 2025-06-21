# Git Commit

Creates a git commit with conventional commit message format.

## Usage

```
git commit
```

## Description

This command will:
1. Check git status to see untracked files and changes
2. Check git diff to see staged and unstaged changes
3. Review recent commit history to understand the project's commit style
4. Analyze changes and create a conventional commit message
5. Stage relevant files and create the commit

## Conventional Commit Format

The commit message follows the conventional commit specification:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types
- `feat`: new feature
- `fix`: bug fix
- `docs`: documentation changes
- `style`: formatting, missing semi colons, etc
- `refactor`: code change that neither fixes a bug nor adds a feature
- `perf`: performance improvement
- `test`: adding missing tests
- `chore`: maintenance tasks, build changes, etc
- `ci`: continuous integration changes
- `build`: build system or external dependencies

### Examples
- `feat(auth): add user authentication`
- `fix(api): handle null response in user endpoint`
- `docs(readme): update installation instructions`
- `refactor(utils): extract common validation logic`
- `chore(deps): update dependencies to latest versions`

## Remarks
- Commit messages should be concise and descriptive and must be written in Japanese.
- One commit should address a single change or feature.
- Must not include personal or sensitive information.

## Output Format

```markdown
git commit -m "docs(claude): Claudeコマンドを追加・改善
- git-commit.md: conventional commit形式のコミットコマンドを追加
- notion-query-database.md: Notionデータベースクエリコマンドを追加
- daily-review.md: 日次振り返りコマンドのフォーマットを改善

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
```
