# 数値の配列を作成
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# for文を使用したループ処理
puts "=== for文での処理 ==="
# =================ここから
for i in numbers
  puts "数値: #{i}, 2倍: #{i * 2}"
end
# =================ここまで選択してCommand + K


# 配列の合計を計算するfor文
sum = 0
for num in numbers
  sum += num
end
puts "合計: #{sum}"