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
    a / b
  end

  def calculate_average(numbers)
    # ここでTabを押して平均値計算を補完
    numbers.sum / numbers.length
  end

  def fibonacci(n)
    # ここでTabを押してフィボナッチ数列を補完
    if n <= 0
      return 0
    elsif n == 1
      return 1
    else
      return fibonacci(n - 1) + fibonacci(n - 2)
    end
  end
end

# 使用例も不完全 - Tabで補完
calc = Calculator.new

# ここでTabを押して使用例を補完
puts calc.add(1, 2)