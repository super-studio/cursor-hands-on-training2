# 不完全なメソッド定義ハンズオン用サンプル
# Tabで不完全なメソッドを補完体験

class Calculator
  def initialize
    @history = []
  end

  # 不完全なメソッド - Tabで補完させる
  def add(a, b)
    # ここでTabを押して処理を補完
    a + b
  end

  def subtract(a, b)
    # ここでTabを押して処理を補完
    a - b
  end

  def multiply(a, b)
    # ここでTabを押して処理を補完
    a * b
  end

  def divide(a, b)
    # ここでTabを押して処理を補完（ゼロ除算も考慮）
    if b == 0
      "ゼロ除算はできません"
    else
      a / b
    end
  end

  def calculate_average(numbers)
    # ここでTabを押して平均値計算を補完
    numbers.sum / numbers.size
  end

  def fibonacci(n)
    # ここでTabを押してフィボナッチ数列を補完
    if n <= 0
      "0以下の値は無効です"
    elsif n == 1
      [0]
    else
      fib = [0, 1]
      (2..n).each do |i|
        fib << fib[-1] + fib[-2]
      end
      fib
    end
  end
end

# 使用例も不完全 - Tabで補完
calc = Calculator.new

# ここでTabを押して使用例を補完
puts calc.add(1, 2)