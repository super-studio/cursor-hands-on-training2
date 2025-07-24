# 数値の配列を作成
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# while文を使用したループ処理
puts "=== while文での処理 ==="
index = 0
while index < numbers.length
  i = numbers[index]
  puts "数値: #{i}, 2倍: #{i * 2}"
  index += 1
end


# 配列の合計を計算するfor文
sum = 0
for num in numbers
  sum += num
end
puts "合計: #{sum}"