# エラーハンドリング不備ハンズオン用サンプル
# Tabでエラーハンドリングを追加体験

class FileProcessor
  def initialize
    @processed_files = []
  end

  def read_file(filename)
    begin
      content = File.read(filename)
      puts "ファイルを読み込みました: #{filename}"
      content
    rescue Errno::ENOENT
      puts "エラー: ファイル '#{filename}' が見つかりません"
      nil
    rescue Errno::EACCES
      puts "エラー: ファイル '#{filename}' へのアクセス権限がありません"
      nil
    rescue => e
      puts "エラー: ファイル読み込み中に予期しないエラーが発生しました: #{e.message}"
      nil
    end
  end

  def write_file(filename, content)
    begin
      File.write(filename, content)
      puts "ファイルに書き込みました: #{filename}"
    rescue => e
      puts "エラー: ファイル書き込み中に予期しないエラーが発生しました: #{e.message}"
    end
  end

  def process_json(json_string)
    begin
      require 'json'
      data = JSON.parse(json_string)
      puts "JSONを解析しました"
      data
    rescue JSON::ParserError
      puts "エラー: 無効なJSON形式です"
      nil
    rescue => e
      puts "エラー: JSON解析中に予期しないエラーが発生しました: #{e.message}"
      nil
  end

  def connect_to_database(host, port, username, password)
    begin
      puts "データベースに接続中..."
      connection = create_connection(host, port, username, password)
      puts "データベースに接続しました"
      connection
    rescue => e
      puts "エラー: データベース接続中に予期しないエラーが発生しました: #{e.message}"
      nil
    end
  end

  def divide_numbers(a, b)
    begin
      result = a / b
      puts "計算結果: #{result}"
      result
    rescue ZeroDivisionError
      puts "エラー: ゼロ除算はできません"
      nil
    rescue => e
      puts "エラー: 計算中に予期しないエラーが発生しました: #{e.message}"
      nil
    end
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
