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
	when 1 then "one"
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

#5.4.2 ブロックの値
p words = %w{zz, xxx, yyy, wwww, bbbbb, cccccc, aaaaaaa}
p words.sort!{ |x, y| y.length <=> x.length }

p array = [0, 1, 2, 3, 4, 5]
array2 = array.collect do |x|
    next 0 if x == nil
    next x, x*x
end
p array2

array = Array.new
p array.collect do |x|
	if x == nil
	  0
	else
	  [x, x*x]
	end
end

#5.4.3 ブロックと変数のスコープ
data = [1, 2, 3, 4, 5]
total = 0
data.each { |x| total += x }
puts total

1.upto(10) do |i|		#10行
    print "trueRow => #{i} * "
	1.upto(10) do |i|       #各行に10列
		print "#{i} "   #列番号を出力
	end			#
	print " ==> Row #{i}\n" #列番号を出力したいが、行番号の処理で書き換えられている。
end

#x = y = 0
#1.upto(4) do |x;y|
#	y = x + 1
#	puts y*y
#end
#[x,y]

#5.4.4 ブロックへの引数渡し
{:one=>1}.each_pair{|key, value| print "#{key}, #{value}\n"}

def two; yield 1,2; end
two {|x| p x } 
two {|*x| p x }  #まとめて配列にする。
two {|x,| p x }  #先頭の一つ以外は無視する。

def five; yield 1,2,3,4,5; end
five do |head, body, *tail|
	print head, body, "#{tail}\n"
end

def hashiter; yield :a=>1, :b=>2; end
hashiter{|hash| puts hash[:a] }

#5.5 制御フローの変更
#5.5.1 retuen
def double(x)
	return nil if x == nil
	return x, x.dup
end
puts double("a")

def find(array, target)
	array.each_with_index do |element, index|
		return index if (element == target)  #イテレータだけでなく、メソッドから抜ける。
	end
	nil					     #見つからなければ、nilを返す。
end

p words = %w{aa bb cc dd ee}
puts find(words, "bb")

#5.5.2 break
#while(line = gets)
#	break if line.chomp == "quit"
#	puts eval(line)
#end
#puts "Good bye!"

#f.each do |line|
#	break if line == "quit\n"
#	puts eval(line)
#end
#puts "Good bye!!"

#5.5.3 next
#while line = gets
#	next if line[0,1] == "#"   #先頭がコメント行ならば。
#	puts eval(line)
#end

p data = [1, 2, 3, -4, 5]
squareroots = data.collect do |x|
	next 0 if x < 0
	Math.sqrt(x)
end
p squareroots

p data = [1, 2, 3, -4, 5]
squareroots2 = data.collect do |x|
	if (x < 0) then 0 else Math.sqrt(x) end
end
p squareroots2

#5.5.4 redo
i = 0
while(i < 3)
	#redoするとここに戻る。
	print i
	i += 1
	redo if i == 3
end

#puts "以下のキーワードから連想する単語を入力してください。"
#words = %w(apple banana cherry)
#response = words.collect do |word|
#	#redoはここに戻る。
#	print word + "> "
#	break nil unless response = gets
#	
#	if response.chomp.size == 0
#		word.upcase!
#		redo
#	end
#	response
#end

#5.5.5 retry
n = 10
n.times do |x|
	print x
	if x == 9
		n -= 1
		retry
	end
end

print "\n"

def repeat_while(x)
	if x
		yield
		retry
	end
end

#5.5.6 throw と catch
#for matrix in data do
#	catch :missing_data do
#		for row in matrix do
#			for value in row do
#				throw :missing_data unless value
#			end
#		end
#	end
#end

#5.6 例外と例外処理
#5.6.1 例外クラスと例外オブジェクト
#5.6.2 raise による例外の生成
def factorial(n)
	raise "bad argument" if n < 1
	return 1 if n == 1
	n*factorial(n-1)
end

puts factorial(6)

#5.6.3 rescueによる例外処理
#5.6.3.1 例外オブジェクトの命名
#begin
#	x = factorial(-1)
#rescue => ex
#	puts "#{ex.class}: #{ex.message}"
#end

begin
	x = factorial(1)
rescue ArgumentError => ex
	puts "1以上の値を指定してください"
rescue TypeError => ex
	puts "整数を指定してください"
end

#5.6.3.3 例外の伝播
def explode
	raise "bam!" if rand(10) == 0
end

def risky
	begin
		10.times do
			explode
		end
	rescue TypeError
		puts $!
	end
	"hello"
end

def defuse
	begin
		puts risky
	rescue RuntimeError => e
		puts e.message
	end
end

defuse

#5.6.3.5 rescue節でのretry
require 'open-uri'
tries = 0
begin
	tries += 1
	open('http://www.example.com/'){|f| puts f.readlines }
rescue OpenURI::HTTPError => e
	puts e.message
	if (tries < 4)
		sleep(2**tries)
		retry
	end
end

#第6章 メソッド、proc、lambda、クロージャ
#6.1 簡単なメソッドの定義
def factorial3(n)
	if n < 1
		raise "argument must be > 0"
	elsif n == 1
		1
	else
		n*factorial(n-1)
	end
end

#6.1.1 メソッドの戻り値
def factorial4(n)
	raise "bad argument" if n < 1
	return 1 if n == 1
	n*factorial(n-1)
end

def polar(x, y)
	return Math.hypot(y, x), Math.atan2(y, x)
end

x, y = polar(5, 5)
p x
p y

def cartesian(magnitude, angle)
	[magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
end

distance, theta = cartesian(5, 5)

p distance
p theta

o = "message"
def o.printme
	puts self
end
o.printme

#a = "aaaaa"
#a.printme

#6.2 メソッド名
#6.2.1 演算子メソッド
def +(other)
	self.concatenate(other)
end

#6.2.2 メソッドの別名
alias plr polar
w, z = plr(5, 5)
p w
p x

def hello
	puts "Hello World"
end

alias original_hello hello

def hello
	puts "お知らせします。 "
	original_hello
	puts "テストでした。 "
end

hello

#6.3 メソッドとかっこ
#6.3.1 省略可能なかっこ
puts "Hello world"
puts ("Hello world")

greeting = "Hello"
size = greeting.length
puts size

x = 3
puts x.between? 1,5

#6.3.2 必須のかっこ
#puts sum 2,2
#puts sum(2,2)

#puts square(2+2)*2
#puts square (2+2)*2

#6.4 メソッド引数
#6.4.1 引数のデフォルト値
def prefix(s, len=1)
	s[0,len]
end

p prefix("Ruby",3)
p prefix("Ruby")

def suffix(s, index=s.size-1)
	s[index, s.size-index]
end
p suffix("Ruby")

def append(x, a=[])
	a << x
end

#6.4.2 可変長引数リストと配列
#def max(first, #rest)
#	max = first
#	rest.each{|x| max = x if x > max}
#	max
#end

#p max(1)
#p max(1,2)
#p max(1,2,3)

#6.4.2.1 メソッドの配列引数
#data = [3,2,1]
#m = max(*data)

