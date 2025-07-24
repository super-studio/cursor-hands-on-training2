# 不完全なメソッド定義ハンズオン用サンプル
# Tabで不完全なメソッドを補完体験

class Calculator
  def initialize
    @history = []
  end

  # 不完全なメソッド - Tabで補完させる
  def add(a, b)
    result = a + b
    @history << "add(#{a}, #{b}) = #{result}"
    result
    # ここでTabを押して処理を補完
  end

  def subtract(a, b)
    result = a - b
    @history << "subtract(#{a}, #{b}) = #{result}"
    result
    # ここでTabを押して処理を補完
  end

  def multiply(a, b)
    result = a * b
    @history << "multiply(#{a}, #{b}) = #{result}"
    result
    # ここでTabを押して処理を補完
  end

  def divide(a, b)
    result = a / b
    @history << "divide(#{a}, #{b}) = #{result}"
    result
    # ここでTabを押して処理を補完（ゼロ除算も考慮）
  end

  def calculate_average(numbers)
    # ここでTabを押して平均値計算を補完
    sum = numbers.sum
    average = sum / numbers.length
    @history << "average(#{numbers.join(', ')}) = #{average}"
    average
  end

  def fibonacci(n)
    # ここでTabを押してフィボナッチ数列を補完
    if n <= 0
      @history << "fibonacci(#{n}) = 0"
      return 0
    elsif n == 1
      @history << "fibonacci(#{n}) = 1"
      return 1
    end

    result = fibonacci(n - 1) + fibonacci(n - 2)
    @history << "fibonacci(#{n}) = #{result}"
    result
  end
end

# 使用例も不完全 - Tabで補完
calc = Calculator.new

# ここでTabを押して使用例を補完
puts calc.