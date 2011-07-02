#3.1.3
require 'rational'
print 5/2, " ", 5.0/2, " ", 5/2.0, "\n"
print 5.0.div(2), " ", 5.0.div(2), " ", 5.quo(2), "\n"

puts x = 5%2
q, r = 10.divmod 3
puts q
puts r

a = 2
puts a**4
puts a**-1
puts a**(1/3.0)

#3.1.4
puts 0.4 - 0.3

#3.2
#3.2.1.1 シングルクォート
print 'O\'Reillyの本を読みませんか？', "\n"
print 'この文字列リテラルの末尾は、単一のバックスラッシュ：\\', "\n"
print 'これはバックスラッシュとクォート：\\\'', "\n"
print 'これは２個のバックスラッシュ：\\\\', "\n"
print 'これは、バックスラッシュと改行を含んだコード\
<-ここにあるよ！シングルクォートでは改行のエスケープできない。', "\n"

#3.2.1.2 ダブルクォート
print "\t\"この引用は、先頭がタブで末尾が改行。\"\n"
print "360° = #{2*Math::PI} ラジアン", "\n"

#3.2.1.4 セパレータ
puts %q( 文字のエスケープは考えなくて良い。)
puts %Q|"元気？"と彼は言った。|

#3.2.1.5 ヒアドキュメント
document = <<HERE
これは文字列リテラル
２行あるよん。
HERE
puts document

greeting = <<HERE + <<THERE + "World!"
Hello
HERE
There
THERE
puts greeting

document2 = <<'ここが文字列の終わり。'
a'
a'
a'
a'
ここが文字列の終わり。
puts document2

#3.2.1.6 バッククォート
puts `ls`
puts %x[ls]

#3.2.1.7 ミュータブルな文字列リテラル（時間概念、状態、アイデンティティをもつ）
10.times { puts "test".object_id }

#3.2.3 文字列演算子
planet = "Earth"
puts "Hello" + " " + planet
puts "Hello" + " " + planet.to_s
#
greeting = "Hello"
greeting << " " << "World"
puts greeting
#
puts alphabet = "A"
puts alphabet << ?B
puts alphabet << 67

puts ellipsis = '.'*3

#3.2.4 文字列へのアクセス
s = 'Hello'
puts s[0]
puts [s.length-1]
puts s[-1]
puts s[-2]
puts s[-s.length]
puts s[s.length]

puts s[0] = ?H
puts s[-1] = ?O

s = 'hello'
puts s[-1] = ""
puts s[-1] = "p!"

s = 'hello'
puts s[0,2]
puts s[-1,1]
puts s[0,0]
puts s[0,10]
puts s[s.length,1]
puts s[s.length+1,1]
puts s[0,-1]

s = 'hello'
puts s[0,1] = "H"
puts s
puts s[s.length,0] = " world!"
puts s
puts s[5,0] = ","
puts s
puts s[5,6] = ""
puts s

s = "hello"
puts s[2..3]
puts s[-3..-1]
puts s[0..0]
puts s[0...0]
puts s[2..1]
puts s[7..10]
puts s[-2..-1] = "p!"
puts s
puts s[0...0] = "please "
puts s
puts s[6..10] = ""
puts s

s = "hello"
while(s["l"])
	puts s["l"] = "L"
end
puts s

s = "hello"
puts s[/[aiueo]/] = "*"
puts s

#3.3 配列
p words = %w[this is a test]
p open  = %w| ( [ { < |
p white = %w(\s \t \r \n )

empty = Array.new
p nils = Array.new(3)
p zeros = Array.new(4, 0)
p copy = Array.new(nils)
puts count = Array.new(3){|i| i+1}

a = [0, 1, 4, 9, 16]
puts a[0]
puts a[-1]
puts a[-2]
puts a[a.size-1]
puts a[-a.size]
puts a[8]
puts a[-8]

a[0] = "zero"
p a
a[-1] = 1..16
p a
a[8] = 64
p a

a = ('a'..'e').to_a
p a
puts a[0,0]
puts a[1,1]
p a[-2,2]
p a[0..2]
p a[-2..-1]
p [0...-1]

a[0,2] = ['A', 'B']
p a
a[2...5] = ['C', 'D', 'E']
p a
a[0,0] = [1, 2, 3]
p a
a[0..2] = []
p a
a[-1,1] = ['Z']
p a
a[-1,1] = 'Z'
p a
a[-2,2] = nil
p a

a = [1,2,3] + [4,5]
p a
a = a + [[6,7,8]]
p a

a = []
a << 1
p a
a << 2 << 3
p a
a << [4,5,6]
p a
a.concat [7,8]
p a
p ['a','b','c','d','e'] - ['b','c','d']
a = [0]*8
p a

a = [1,1,2,2,3,3,4]
b = [5,5,4,4,3,3,2]
p a|b
p b|a
p a&b
p b&a

a = ('A'..'Z').to_a
a.each { |x| print x }
puts " "

#3.4 ハッシュ
numbers = Hash.new
numbers["one"] = 1
numbers["two"] = 2
numbers["three"] = 3
p numbers

sum = numbers["one"] + numbers["two"]
puts sum

cold_war = 1945...1989
puts cold_war.include? 1950

r = 'a'..'c'
r.each { |l| print "[#{l}]"}
r.step(2) { |l| print "[#{l}]"}
r.to_a
p r

r = 0...100
puts r.member? 50
puts r.include? 100
puts r.include? 99.9

#3.6 シンボル
#3.7 true,false,nil
 o =Array.new
 puts o.nil?
#3.8 オブジェクト
#3.8.1 オブジェクト参照
s = "Ruby"
t = s
t[-1] = ""
puts s
t = "Java"
print s, t, "\n"


#3.8.4 オブジェクトのクラスと型
o = "test"
puts o.class
puts o.class.superclass
puts o.class.superclass.superclass

puts o.class == String
puts o.instance_of? String 

x = 1
puts x.instance_of? Fixnum
puts x.instance_of? Numeric
puts x.is_a? Integer
puts x.is_a? Numeric
puts x.is_a? Comparable
puts x.is_a? Object

puts o.respond_to? :"<<"

#3.8.5 オブジェクトの等値性
#3.8.5.1 equal?メソッド
a = "Ruby"
b = c = "Ruby"
puts a.equal?(b)
puts b.equal?(c)
puts a.object_id == b.object_id

#3.8.5.2 ==演算子
a = "Runy"
b = "Ruby"
puts a.equal?(b)
puts a == b

#3.8.5.3 eql?メソッド
puts 1 == 1.0
puts 1.eql?(1.0)

#3.8.5.4 ===演算子
puts (1..10) === 5
puts /\d+/ === "123" 
puts String === "s"
puts :s === "s"

#3.8.6 オブジェクトの順序
puts 1 <=> 5
puts 5 <=> 5
puts 9 <=> 5
puts "1" <=> 5

puts 1.between?(0,10)
puts nan = 0.0/0.0
puts nan < 0
puts nan > 0
puts nan == 0
puts nan == nan
nan.equal?(nan)

#3.8.7.4 算術演算子の強制型変換
p 1.1.coerce(1)
require "rational"
r = Rational(1,3)
p r.coerce(2)

#3.8.10 オブジェクトのフリーズ
s = "ice"
s.freeze
puts s.frozen?
#puts s.upcase!
#puts s[0] = "nil"
a = s.dup
puts a.frozen?

 

