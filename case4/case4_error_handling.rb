# エラーハンドリング不備ハンズオン用サンプル
# Tabでエラーハンドリングを追加体験

class FileProcessor
  def initialize
    @processed_files = []
  end

  def read_file(filename)
    # エラーハンドリングなし
    content = File.read(filename)
    puts "ファイルを読み込みました: #{filename}"
    content
  end

  def write_file(filename, content)
    # エラーハンドリングなし
    File.write(filename, content)
    puts "ファイルに書き込みました: #{filename}"
  end

  def process_json(json_string)
    # JSON解析エラーハンドリングなし
    require 'json'
    data = JSON.parse(json_string)
    puts "JSONを解析しました"
    data
  end

  def connect_to_database(host, port, username, password)
    # データベース接続エラーハンドリングなし
    puts "データベースに接続中..."
    connection = create_connection(host, port, username, password)
    puts "データベースに接続しました"
    connection
  end

  def divide_numbers(a, b)
    # ゼロ除算エラーハンドリングなし
    result = a / b
    puts "計算結果: #{result}"
    result
  end

  private

  def create_connection(host, port, username, password)
    # 仮のコネクション作成（実際のDBライブラリは使用しない）
    { host: host, port: port, username: username, connected: true }
  end
end

# 使用例（エラーが発生しやすいケース）
processor = FileProcessor.new

# ファイルが存在しない場合
processor.read_file("nonexistent.txt")

# 不正なJSON
processor.process_json("{ invalid json }")

# ゼロ除算
processor.divide_numbers(10, 0)
