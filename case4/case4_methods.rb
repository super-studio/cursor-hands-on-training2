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
      raise "ゼロ除算はできません"
    end
    a / b
  end

  def calculate_average(numbers)
    # ここでTabを押して平均値計算を補完
    if numbers.empty?
      raise "空の配列は計算できません"
    end
    numbers.sum / numbers.size
  end

  def fibonacci(n)
    # ここでTabを押してフィボナッチ数列を補完
    if n <= 0
      raise "0以下の数値は計算できません"
    end
    if n == 1
      return [0]
    end
    fib = [0, 1]
    (2..n).each do |i|
      fib << fib[-1] + fib[-2]
    end
    fib
  end
end

# 使用例も不完全 - Tabで補完
calc = Calculator.new

# ここでTabを押して使用例を補完
puts calc.add(1, 2)
puts calc.subtract(1, 2)
puts calc.multiply(1, 2)
puts calc.divide(1, 2)
puts calc.calculate_average([1, 2, 3, 4, 5])
puts calc.fibonacci(10)