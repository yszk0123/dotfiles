# Notion データベース概要

Notion MCP ツールを使用して Year, Month, Week, Day の主要データベースの概要を取得し、構造を理解するためのコマンドです。

## データベース一覧

### 1. Year データベース
- **ID**: `115350ae6a30800998c2e88ed39327ea`
- **目的**: 1年から数十年変わらないような、自分の中で大切にしたい価値観など。多くても5個くらい
- **アイコン**: 🏛️ (government_green)
- **主要プロパティ**:
  - `Name`: タイトル
  - `Content`: 価値観の詳細内容
  - `Month`: 関連する月の計画への参照
  - `CreatedAt`, `UpdatedAt`: 作成・更新日時

### 2. Month データベース
- **ID**: `b8aa3691f17d412f85fdf8c116b8c5d9`
- **目的**: 1ヶ月から1年程度で終わる計画。自信をもって行動したい。そのために、目的・方針・目標を決める
- **アイコン**: 📅 (calendar-month_green)
- **主要プロパティ**:
  - `Name`: 計画名
  - `Content`: なぜやるのか。上位目的とのつながり。実現可能だと判断した進め方
  - `Status`: 未着手/今週やる/進行中/今年続ける/待機中/ゴミ箱/完了
  - `Range`: 期間設定
  - `Year`: 関連する年の価値観への参照
  - `Week`: 関連する週タスクへの参照
  - `Day`: 関連する日タスクへの参照
  - `指標`: 進捗状況の表示（チェック/タスク/期限）

### 3. Week データベース
- **ID**: `114350ae6a30806a81c2e306aa482182`
- **目的**: 1日から1週間程度で終わる計画およびタスク。客観的な事実は Category: Checkpoint、自分の意見は Category: Chat にまとめる
- **アイコン**: 🚩 (flag_red)
- **主要プロパティ**:
  - `Name`: タスク名
  - `Content`: タスクの詳細
  - `Status`: 未着手/進行中/失敗/完了
  - `Category`: Chat/Review/Checkpoint
  - `Date`: 実行日
  - `Month`: 関連する月の計画への参照
  - `Day`: 関連する日タスクへの参照
  - `進捗`: 完了した日タスクの割合表示

### 4. Day データベース
- **ID**: `11c95f5706ba4465be05f7951fc80162`
- **目的**: 1日以内、ひと続きの作業で完結するタスクや、その時々で思いついた感想を蓄積する。タスク・客観的な事実は Category: Event、感想・自分の意見は Category: Chat にまとめる
- **アイコン**: ☑️ (checkmark-square_red)
- **主要プロパティ**:
  - `Name`: タスク名
  - `Content`: やったこと・感じたことなどを簡潔に書く
  - `Category`: Event/Chat/Review/依頼中/Trash/Scheduled/Quote
  - `完了`: チェックボックス
  - `Date`: 実行日時
  - `Week`: 関連する週タスクへの参照
  - `Month`: 関連する月の計画への参照
  - `Reference`: 関連する外部資料への参照
  - `消費`: 易しい/普通/難しい（タスクの難易度）

### 5. Reference データベース
- **ID**: `cae4e8c229904540b432d2d254dcc3f8`
- **目的**: 外部資料・リンク・書籍・記事などの参考情報を管理。Dayタスクから参照される知識ソースの集約
- **アイコン**: 📚 (books)
- **主要プロパティ**:
  - `Name`: 資料名・タイトル
  - `URL`: 外部リンク（記事・動画等）
  - `Category`: 一般書/記事/動画/その他（資料の種類）
  - `Content`: 資料の要約・メモ・重要ポイント
  - `Tags`: 分類・検索用タグ
  - `CreatedAt`, `UpdatedAt`: 作成・更新日時
  - `Status`: 未読/読了/参考中（学習状況）

## 階層構造

```
Year (価値観・長期方針)
  ↓
Month (月次〜年次計画)
  ↓
Week (週次タスク・計画)
  ↓
Day (日次タスク・感想)
  ↓
Reference (参考資料・知識ソース)
```

## 基本クエリ例

### 最近の Week タスクを取得
```javascript
// Notion MCP ツールでの実行例
mcp__notion-mcp__API-post-database-query({
  database_id: "114350ae6a30806a81c2e306aa482182",
  sorts: [{ property: "UpdatedAt", direction: "descending" }],
  page_size: 10
})
```

### 進行中の Month プロジェクトを取得
```javascript
mcp__notion-mcp__API-post-database-query({
  database_id: "b8aa3691f17d412f85fdf8c116b8c5d9",
  filter: {
    property: "Status",
    status: { equals: "進行中" }
  }
})
```

### 今日の Day タスクを取得
```javascript
mcp__notion-mcp__API-post-database-query({
  database_id: "11c95f5706ba4465be05f7951fc80162",
  filter: {
    property: "Date",
    date: { equals: "2025-06-18" }
  }
})
```

### Reference データベースから書籍を検索
```javascript
mcp__notion-mcp__API-post-database-query({
  database_id: "cae4e8c229904540b432d2d254dcc3f8",
  filter: {
    property: "Category",
    select: { equals: "一般書" }
  },
  sorts: [{ property: "UpdatedAt", direction: "descending" }]
})
```

### 特定のタグを持つ参考資料を取得
```javascript
mcp__notion-mcp__API-post-database-query({
  database_id: "cae4e8c229904540b432d2d254dcc3f8",
  filter: {
    property: "Tags",
    multi_select: { contains: "デザイン" }
  }
})
```

## 特記事項

データ取得を求められた場合、とくに指定がない場合は `Date` プロパティで降順ソートしてください。

## 実行例

```bash
claude /project:notion-query-database
```

このコマンドを実行すると、各データベースの詳細情報とサンプルクエリが表示されます。
