# Case 7: Project Rulesを使用したPR作成ハンズオン

## 目的
Cursor の Project Rules 機能を活用して、一貫したPull Request作成フローを実行します。

## 手順

### 1. 新しいチャットセッションの開始
1. Cursor で「New Chat」を開く
2. モードが「Agent」になっていることを確認

### 2. ブランチの作成
1. 自分の名前でgit branchを作成
   ```
   例: git checkout -b hideki_maekawa
   ```

### 3. Project Rules の呼び出し
1. チャット入力欄に以下を入力：
   ```
   @pr-creation-workflow.mdc
   ```
2. 実行ボタンをクリック

### 4. 自動実行される手順
Project Rules により以下が自動実行されます：
1. ブランチの確認
2. 変更のステージング
3. ステージングされた変更の確認
4. コミット作成
5. リモートへのプッシュ
6. Pull Request の作成

### 5. Pull Request の確認
1. [https://github.com/super-studio/cursor-hands-on-training/pulls](https://github.com/super-studio/cursor-hands-on-training/pulls) にアクセス
2. 自分の名前でブランチが作成されたPull Requestが表示されることを確認
3. PRのタイトルと内容が正しく設定されていることを確認

## 期待される結果
- 個人ブランチが作成される
- これまでの変更がコミットされる
- Pull Request が自動生成される
- GitHub上にPRが作成される

## ポイント
- `@` でProject Rulesファイルを指定できる
- 一連のgit操作が自動化される
- 統一されたPRフォーマットが適用される
- 手動でのコマンド実行ミスを防げる
- commit生成だけを自動化したり、pull request/issue作成だけを自動化するなど様々なruleを作成することができる。
