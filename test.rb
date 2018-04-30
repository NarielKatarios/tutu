a = '7 / 3'
until a == 'end'
a = a.split(' ')
x = a[0].scan('.').size > 0 ? a[0].to_f : a[0].to_i
y = a[2].scan('.').size > 0 ? a[2].to_f : a[2].to_i
if a.include?('+')
  puts x.integer? & y.integer? ?  (x + y) : (x + y).round(3)
elsif a.include?('-')
  puts x.integer? & y.integer? ?  (x - y) : (x - y).round(3)
elsif a.include?('*')
  puts x.integer? & y.integer? ?  (x * y) : (x * y).round(3)
elsif a.include?('/')
  puts x.integer? & y.integer? ?  (x / y) : (x / y).round(3)
elsif a.include?('%')
  puts x.integer? & y.integer? ?  (x % y) : (x % y).round(3)
end
a = gets.chomp
end