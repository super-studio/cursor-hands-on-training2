# Case 8: Cursor Rules作成ハンズオン

## 目的
Cursor の Generate Cursor Rules 機能を使用して、カスタムProject Ruleを作成します。

## 手順

### 1. 新しいチャットセッションの開始
1. Cursor で「New Chat」を開く
2. モードが「Agent」になっていることを確認

### 2. Generate Cursor Rules の実行
1. チャット入力欌に以下を入力：
   ```
   /Generate Cursor Rules
   ```
2. 実行後、以下のプロンプトをコピー&ペーストする：

```
以下の機能を持つProject Ruleを作成してください：

1. 既存のPull RequestをMCPのGitHubツールを使用してRails5の観点でコードレビューを実行する
2. 以下の手順で動作する自動化されたワークフロー：
   - git コマンドでローカルブランチ名とリモートURL情報を取得
   - mcp_GitHub_list_pull_requests で現在のブランチに対応するPRを検索
   - mcp_GitHub_get_pull_request_files でPRの変更内容を取得
   - Rails5の観点（セキュリティ、パフォーマンス、Rails規約、DB設計、テスト等）で詳細分析
   - 構造化されたレビューレポートを日本語で出力

3. 以下のRails5レビュー観点を含める：
   - セキュリティ（SQLインジェクション、XSS、CSRF、Strong Parameters等）
   - パフォーマンス（N+1問題、インデックス、キャッシュ等）
   - Rails規約・コード品質（命名規則、MVC構造、DRY原則等）
   - データベース・マイグレーション
   - テスト（カバレッジ、モック、エッジケース等）

4. レビュー結果は以下の形式で出力：
   - 基本情報（PR番号、タイトル、変更統計）
   - 合格項目・改善提案・要修正項目
   - 各観点別の総合評価
   - 推奨アクション（APPROVE/REQUEST_CHANGES/COMMENT）

5. 実行後は必ずチャットに日本語でレビュー結果を記載する

注意
- ファイル名はpr-review-workflow
```

### 3. 生成されたRuleの確認
1. `.cursor/rules/pr-review-rails.mdc` ファイルが作成されることを確認
2. ファイルの内容を確認し、必要に応じて調整

## 期待される結果
- カスタムProject Ruleファイルが作成される
- AIによるPRレビュー機能が実装される
- MCPのGitHubツールと連携した自動化ワークフローが構築される

## ポイント
- `/Generate Cursor Rules` でProject Rule作成が可能
- 大枠をこれで作って、調整していくのがおすすめ
- MCPツールを使うことを明記すればgithub MCPを使ってくれる
- チームで協力してreview観点を整備すれば、レビューの工数削減につながる

## 応用例
- notion mcpやjira mcpで過去の障害をもとにreview観点を追加する
