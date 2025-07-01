# 不完全なメソッド定義ハンズオン用サンプル
# Tabで不完全なメソッドを補完体験

class Calculator
  def initialize
    @history = []
  end

  # 不完全なメソッド - Tabで補完させる
  def add(a, b)
    a + b
    # ここでTabを押して処理を補完
  end

  def subtract(a, b)
    a - b
    # ここでTabを押して処理を補完
  end

  def multiply(a, b)
    a * b
    # ここでTabを押して処理を補完
  end

  def divide(a, b)
    a / b
    # ここでTabを押して処理を補完（ゼロ除算も考慮）
  end

  def calculate_average(numbers)
    numbers.sum / numbers.length
    # ここでTabを押して平均値計算を補完
  end

  def fibonacci(n)
    if n <= 0
      return 0
    elsif n == 1
      return 1
    else
      return fibonacci(n - 1) + fibonacci(n - 2)
    end
    # ここでTabを押してフィボナッチ数列を補完
  end
end

# 使用例も不完全 - Tabで補完
calc = Calculator.new

# ここでTabを押して使用例を補完
puts calc.