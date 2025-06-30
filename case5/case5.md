# Case 5: GitHub MCP接続ハンズオン

## 目的
CursorにGitHub MCPを接続し、GitHub上のリポジトリと連携する機能を有効化します。

## 前提条件
- Docker Desktop が起動していること
- GitHub Personal Access Token が準備されていること

## 手順

### 1. GitHub MCP の追加
1. [https://docs.cursor.com/tools](https://docs.cursor.com/tools) にアクセス
2. 「Add GitHub To Cursor」ボタンを押下

### 2. Personal Access Token の設定
1. `GITHUB_PERSONAL_ACCESS_TOKEN` フィールドにaccess_tokenを入力
2. 「Install」ボタンを押下

### 3. 接続確認
- MCP Tools の GitHub が緑色になる
- 「51 tools」と表示される
- 上記が確認できれば接続成功

## トラブルシューティング
うまくいかない場合は以下の設定を確認：

### Docker Desktop の確認
- Docker Desktop が起動していることを確認
- コンテナが正常に動作していることを確認

### Access Token の確認
- GitHub Personal Access Token が有効であることを確認
- 適切な権限が付与されていることを確認

## 期待される結果
- GitHub MCP が正常に接続される
- Cursor内でGitHub関連の操作が可能になる
- 51個のGitHub関連ツールが利用可能になる
  - toolは個別にon/offできるので、不要なツールは削除することを推奨

## ポイント
- MCP（Model Context Protocol）により外部サービスとの連携が可能
- Docker環境が必要なため事前起動が重要
- Personal Access Tokenの管理には十分注意すること