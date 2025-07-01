# エラーハンドリング不備ハンズオン用サンプル
# Tabでエラーハンドリングを追加体験

class FileProcessor
  FILE_READ_MESSAGE = "ファイルを読み込みました:"
  FILE_WRITE_MESSAGE = "ファイルに書き込みました:"
  JSON_PARSE_MESSAGE = "JSONを解析しました:"
  DATABASE_CONNECTION_MESSAGE = "データベースに接続しました:"
  DIVIDE_NUMBERS_MESSAGE = "計算結果:"

  def initialize
    @processed_files = []
  end

  def read_file(filename)
    # エラーハンドリングなし
    content = File.read(filename)
    puts FILE_READ_MESSAGE + filename
    content
  end

  def write_file(filename, content)
    # エラーハンドリングなし
    File.write(filename, content)
    puts FILE_WRITE_MESSAGE + filename
  end

  def process_json(json_string)
    # JSON解析エラーハンドリングなし
    require 'json'
    data = JSON.parse(json_string)
    puts JSON_PARSE_MESSAGE
    data
  end

  def connect_to_database(host, port, username, password)
    # データベース接続エラーハンドリングなし
    puts DATABASE_CONNECTION_MESSAGE
    connection = create_connection(host, port, username, password)
    puts DATABASE_CONNECTION_MESSAGE
    connection
  end

  def divide_numbers(a, b)
    # ゼロ除算エラーハンドリングなし
    result = a / b
    puts DIVIDE_NUMBERS_MESSAGE + result.to_s
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
