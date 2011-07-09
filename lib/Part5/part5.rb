#５章 文と制御構造
#5.1 条件分岐
#5.1.1 if
x = 1
if x < 10 
	x += 1
end
puts x

if x < 10 then x += 1 end
puts x

if x < 10 then
	x += 1
end
puts x

#5.1.1.1 else
data = Array.new
if data then
	data << x
else
	data = [x]
end
p data
print "\n"

if x == 1 then
	name = "one"
elsif x == 2 then
	name = "two"
elsif x == 3 then name = "three"
elsif x == 4 ; name = "four"
else
	name = "many"
end
puts name

#5.1.1.3 値
name = if    x == 1 then "one"
       elsif x == 2 then "two"
       elsif x == 3 then "three"
       elsif x == 4 then "four"
       else              "many"
end
puts name

#5.1.2 修飾子としてのif
message ="ohayou!"
puts message if message

#5.1.3 unless
o = 123
puts s = unless o.nil? then
	o.to_s
end
p s

p s = unless o.nil? then o.to_s end

p s = o.to_s unless o.nil?

#5.1.4 case
x = 1
name =  case
	when x == 1 then "one"
	when x == 2 then "two"
	when x == 3 then "three"
	when x == 4 then "four"
	else "many"
	end
puts name

x = 2
name =  case x
	when 1 
	 "one"
	when 2 then "two"
	when 3 ; "three"
	else "many"
	end
puts name

x = 8
name =  case
	when 1 === x then "one"
	when 2 === x then "two"
	when 3 === x then "three"
	else "many"
	end
puts name

#xが属するクラスによって異なる処理を行う。
puts case x
     when String then "string"
     when Numeric then "numeric"
     when TrueClass, FalseClass then "boolean"
     else "other"
     end

puts income = 333333
puts tax = case income
	   when 0..7550
		income * 0.1
	   when 7550..30650
		755 + (income - 7550) * 0.15
	   when 30650..74200
		4200 + (income - 30655) * 0.25
	   when 74200..154800
		15107.5 + (income - 74201) * 0.28
	   when 154800..336550
		37675.5 + (income - 154800) * 0.33
	   else
		97653 + (income - 336550) * 0.35
	   end

#ユーザの入力をうけて処理し、コメントは無視する。
#"quit"で終了する。
#puts "入力された文字列を反転します。 終了-> quit "
#while line=gets do
#	case line.chomp
#	when /^\s*#/
#		next
#	when /^quit$/i
#		break
#	else
#		puts line.reverse
#	end
#
puts "kokomadekiteru?"
def hasValue?(x)
	case x
	when nil, [], "", 0
	  false
	else
	  true
	end
end

puts hasValue?("aaa")

#5.2 繰り返し
#5.2.1 while と until
x = 10
while x >= 0 do
	puts x
	x = x - 1
end

x = 0
until x > 10 do
	puts x
	x = x + 1
end

#5.2.2 修飾子としてのwhile,until
x = 0
puts x = x + 1 while x < 10

x = 0
while x < 10 do puts x = x + 1 end

a = [1,2,3]
puts a.pop until a.empty?

x = 10
begin
	puts x
	x = x - 1
end until x == 0

#5.2.3 for/in ループ
#配列の要素を出力
array = [1,2,3,4,5]
for element in array
	puts element
end
#ハッシュのキーと値を出力
hash = {:a=>1, :b=>2, :c=>3}
for key,value in hash
	puts "#{key} => #{value}"
end

hash.each do |key, value|
	puts "#{key} => #{value}"
end

#5.3 イテレータとEnumerableオブジェクト
#5.3.1 数値イテレータ
4.upto(6) { |x| print x}
print "\n"
3.times { |x| print x }
print "\n"
0.step(Math::PI, 0.1){|x| puts Math.sin(x)}

#5.3.2 Enumerable オブジェクト
[1,2,3].each{|x| print x}
(1..3).each{|x| print x}

filename = "aaa.txt"
File.open(filename) do |f|
	f.each{|line| puts line}
end

File.open(filename) do |f|
	f.each_with_index do |line,number|
		print "#{number}: #{line}"
	end
end

squares = [1,2,3].collect { |x| x*x }
p squares
evens  = (1..10).select { |x| x%2 == 0 }
p evens
odds = (1..10).reject { |x| x%2 == 0 }
p odds

data = [2,5,3,4]
sum = data.inject {|sum, x| sum + x}
puts sum
floatprod = data.inject(1.0){|p, x| p*x}
puts floatprod
max = data.inject {|m, x| m > x ? m : x }
puts max

#5.3.3 カスタムイテレータ
def twice
	yield
	yield
end

twice do
puts "aaa"
end

def sequence(n,m,c)
	i = 0
	while(i < n)
		yield m*i + c
		i += 1
	end
end

sequence(3,5,1){ |y| puts y}


def circle(r,n)
	n.times do |i|
		angle = Math::PI*2*i/n
		yield r*Math.cos(angle), r*Math.sin(angle)
	end
end

circle(1,4){|x,y| printf "(%.2f, %.2f) ", x, y }
print "\n"

def  sequence2(n,m,c)
	i,s = 0, []
	while(i < n)
		y = m*i + c
		yield y if block_given?
		s << y
		i += 1
	end
	s
end

sequence2(3,5,1){ |y| puts y}

#5.3.4 Enumerator
#Enumerator -> 他のオブジェクトを数え上げることを目的とするEnumerableオブジェクト
require 'enumerator'
#s = "hello"
#ss = s.enum_for.map{|c| c.succ}
#puts ss

#enumerator = 3.times
#enumerator.each { |x| print x}
#print "\n"

#downtoはselectメソッドを持つEnumeratorを返す
#p 10.downto(1).select{ |x| x%2==0 }

#each_byteは、to_aメソッドをもつEnumeratorを返す
#p "hello".each_byte.to_a

#5.4 ブロック
#5.4.1 ブロックの構文
1.upto(10) { |x| puts x}
1.upto(10) do |x|
  puts x
end

1.upto(3){|x| puts x}
1.upto 3 do |x| puts x end

hash.each do |key, value|
  puts "#{key}: #{value}"
end

 
