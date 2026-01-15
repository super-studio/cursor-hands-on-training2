# 数値の配列を作成
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# for文を使用したループ処理
puts "=== for文での処理 ==="
# =================ここから
i = 0
while i < numbers.length
  num = numbers[i]
  puts "数値: #{num}, 2倍: #{num * 2}"
  i += 1
end
# =================ここまで選択してCommand + K


# 配列の合計を計算するfor文
sum = 0
for num in numbers
  sum += num
end
puts "合計: #{sum}"