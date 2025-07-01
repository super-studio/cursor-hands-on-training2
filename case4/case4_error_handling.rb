# エラーハンドリング不備ハンズオン用サンプル
# Tabでエラーハンドリングを追加体験

class FileProcessor
  def initialize
    @processed_files = []
  end
  # ファイルが存在しない場合のエラーハンドリング
  def read_file(filename)
    # エラーハンドリングなし
    raise "ファイルが存在しません" unless File.exist?(filename)
    content = File.read(filename)
    puts "ファイルを読み込みました: #{filename}"
    content
  end
  # ファイルが存在しない場合のエラーハンドリング
  def write_file(filename, content)
    # エラーハンドリングなし
    raise "ファイルが存在しません" unless File.exist?(filename)
    File.write(filename, content)
    puts "ファイルに書き込みました: #{filename}"
  end
  # JSON解析エラーハンドリングなし
  def process_json(json_string)
    # JSON解析エラーハンドリングなし
    raise "JSONが不正です" unless json_string.is_a?(String)
    require 'json'
    data = JSON.parse(json_string)
    puts "JSONを解析しました"
    data
  end
  # データベース接続エラーハンドリングなし
  def connect_to_database(host, port, username, password)
    # データベース接続エラーハンドリングなし
    raise "データベースに接続できません" unless host && port && username && password
    puts "データベースに接続中..."
    connection = create_connection(host, port, username, password)
    puts "データベースに接続しました"
    connection
  end
  # ゼロ除算エラーハンドリングなし
  def divide_numbers(a, b)
    # ゼロ除算エラーハンドリングなし
    raise "ゼロ除算はできません" if b == 0
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
