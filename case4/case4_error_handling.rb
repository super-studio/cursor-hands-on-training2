# エラーハンドリング不備ハンズオン用サンプル
# Tabでエラーハンドリングを追加体験

class FileProcessor
  ERROR_MESSAGE = "JSONを解析しました"
  SUCCESS_MESSAGE = "ファイルを読み込みました"
  SUCCESS_MESSAGE = "ファイルに書き込みました"
  SUCCESS_MESSAGE = "データベースに接続しました"
  SUCCESS_MESSAGE = "計算結果: #{result}"
  
  def initialize
    @processed_files = []
  end

  def read_file(filename)
    # エラーハンドリングなし
    content = File.read(filename)
    puts SUCCESS_MESSAGE
    content
  end

  def write_file(filename, content)
    # エラーハンドリングなし
    File.write(filename, content)
    puts SUCCESS_MESSAGE
  end

  def process_json(json_string)
    # JSON解析エラーハンドリングなし
    require 'json'
    data = JSON.parse(json_string)
    puts ERROR_MESSAGE
    data
  end

  def connect_to_database(host, port, username, password)
    # データベース接続エラーハンドリングなし
    puts SUCCESS_MESSAGE
    connection = create_connection(host, port, username, password)
    puts SUCCESS_MESSAGE
    connection
  end

  def divide_numbers(a, b)
    # ゼロ除算エラーハンドリングなし
    result = a / b
    puts SUCCESS_MESSAGE
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
