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
    rescue => e
      puts "ファイルを読み込めませんでした: #{e.message}"
      return nil
    end
    puts "ファイルを読み込みました: #{filename}"
    content
  end

  def write_file(filename, content)
    # エラーハンドリングなし
    begin
      File.write(filename, content)
    rescue => e
      puts "ファイルに書き込めませんでした: #{e.message}"
      return nil
    end
    puts "ファイルに書き込みました: #{filename}"
  end

  def process_json(json_string)
    # JSON解析エラーハンドリングなし
    require 'json'
    begin
      data = JSON.parse(json_string)
    rescue => e
      puts "JSONを解析できませんでした: #{e.message}"
      return nil
    end
    puts "JSONを解析しました"
    data
  end

  def connect_to_database(host, port, username, password)
    # データベース接続エラーハンドリングなし
    begin
      puts "データベースに接続中..."
    connection = create_connection(host, port, username, password)
    rescue => e
      puts "データベースに接続できませんでした: #{e.message}"
      return nil
    end
    puts "データベースに接続しました"
    connection
  end

  def divide_numbers(a, b)
    # ゼロ除算エラーハンドリングなし
    begin
      result = a / b
    rescue => e
      puts "ゼロ除算です: #{e.message}"
      return nil
    end
    puts "計算結果: #{result}"
    result
  end

  private

  def create_connection(host, port, username, password)
    # 仮のコネクション作成（実際のDBライブラリは使用しない）
    begin
      { host: host, port: port, username: username, connected: true }
    rescue => e
      puts "コネクション作成できませんでした: #{e.message}"
      return nil
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
