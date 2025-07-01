# エラーハンドリング不備ハンズオン用サンプル
# Tabでエラーハンドリングを追加体験

class FileProcessor
  def initialize
    @processed_files = []
  end

  def read_file(filename)
    # エラーハンドリングなし
    begin
      content = File.read(filename)
      puts "ファイルを読み込みました: #{filename}"
      content
    rescue => e
      puts "ファイルの読み込みに失敗しました: #{e.message}"
      nil
    end
  end

  def write_file(filename, content)
    # エラーハンドリングなし
    begin
      File.write(filename, content)
      puts "ファイルに書き込みました: #{filename}"
    rescue => e
      puts "ファイルの書き込みに失敗しました: #{e.message}"
    end
  end

  def process_json(json_string)
    # JSON解析エラーハンドリングなし
    require 'json'
    begin
      data = JSON.parse(json_string)
      puts "JSONを解析しました"
      data
    rescue => e
      puts "JSONの解析に失敗しました: #{e.message}"
      nil
    end
  end

  def connect_to_database(host, port, username, password)
    # データベース接続エラーハンドリングなし
    begin
      puts "データベースに接続中..."
      connection = create_connection(host, port, username, password)
      puts "データベースに接続しました"
      connection
    rescue => e
      puts "データベースの接続に失敗しました: #{e.message}"
      nil
    end
  end

  def divide_numbers(a, b)
    # ゼロ除算エラーハンドリングなし
    begin
      result = a / b
      puts "計算結果: #{result}"
      result
    rescue => e
      puts "ゼロ除算が発生しました: #{e.message}"
      nil
    end
  end

  private

  def create_connection(host, port, username, password)
    # 仮のコネクション作成（実際のDBライブラリは使用しない）
    begin
      { host: host, port: port, username: username, connected: true }
    rescue => e
      puts "データベースの接続に失敗しました: #{e.message}"
      nil
    end
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
