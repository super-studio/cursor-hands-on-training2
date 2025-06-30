# Case 6: GitHub MCP連携（Issue取得・実装）

## 目的
CursorのGitHub MCP機能を使用してissueを取得し、その内容を実装する方法を学習します。

## 手順

### 1. 新規チャットを開く
- 右サイドバー（チャット）が開いていることを確認
- モードが「Agent」になっていることを確認

### 2. GitHub MCP機能の利用
1. チャット入力欄に以下の指示を入力：
   ```
   issues/5をmcpで取得して実装して下さい
   ```
2. 実行ボタンをクリック

### 3. 変更内容の確認
- 生成されたHTMLファイルを確認
- 問題なければ「Accept」を選択

### 6. ブラウザで確認
- 作成された`case6/index.html`をブラウザで開く
- 「todoアプリ」が表示されることを確認

## 期待される結果
- GitHub MCPを通じてopenなissueが自動取得される
- Issue #5の要件に従って`case6/index.html`が作成される
- ブラウザで「hello world」が表示される

## ポイント
- GitHub MCP機能により、リポジトリのissueを取得可能
- Issue内容を理解して自動的に実装が行われる