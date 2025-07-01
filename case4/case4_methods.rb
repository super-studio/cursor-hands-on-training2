# 不完全なメソッド定義ハンズオン用サンプル
# Tabで不完全なメソッドを補完体験

class Calculator
  # ========= スタート =========
  MAX_HISTORY_SIZE = 100
  # ========= エンド =========  

  def initialize
    @history = []
  end

  # 不完全なメソッド - Tabで補完させる
  def add(a, b)
    # ここでTabを押して処理を補完
    result = a + b
    add_to_history(result)
    result
  end

  def subtract(a, b)
    # ここでTabを押して処理を補完
    result = a - b
    add_to_history(result)
    result
  end

  def multiply(a, b)
    # ここでTabを押して処理を補完
    result = a * b
    add_to_history(result)
    result
  end

  def divide(a, b)
    # ここでTabを押して処理を補完（ゼロ除算も考慮）
    if b == 0
      puts "ゼロ除算はできません"
      return false
    end
    result = a / b
    add_to_history(result)
    result
  end

  def calculate_average(numbers)
    # ここでTabを押して平均値計算を補完
    if numbers.empty?
      puts "数値がありません"
      return false
    end
    sum = numbers.sum
    average = sum / numbers.size
    add_to_history(average)
    average
  end

  def fibonacci(n)
    # ここでTabを押してフィボナッチ数列を補完
    if n <= 0
      puts "正の整数を入力してください"
      return false
    end
    sequence = [0, 1]
    (2..n).each do |i|
      sequence << sequence[-1] + sequence[-2]
    end
    add_to_history(sequence)
    sequence
  end

  private

  def add_to_history(result)
    @history << result
    @history.shift if @history.size > MAX_HISTORY_SIZE
  end
end

# 使用例も不完全 - Tabで補完
calc = Calculator.new

# ここでTabを押して使用例を補完
puts calc.add(1, 2)
puts calc.subtract(3, 4)
puts calc.multiply(5, 6)
puts calc.divide(7, 0)
puts calc.calculate_average([8, 9, 10])
puts calc.fibonacci(10)