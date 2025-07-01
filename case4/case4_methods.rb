# 不完全なメソッド定義ハンズオン用サンプル
# Tabで不完全なメソッドを補完体験

class Calculator
  def initialize
    @history = []
  end

  # 不完全なメソッド - Tabで補完させる
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    a / b
  end

  def calculate_average(numbers)
    numbers.sum / numbers.size
  end

  def fibonacci(n)
    if n <= 1
      n
    else
      fibonacci(n - 1) + fibonacci(n - 2)
    end
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