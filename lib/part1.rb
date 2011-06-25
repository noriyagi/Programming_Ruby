#第１章　イントロダクション

print "1のクラスは: ", 1.class, "\n"
print "0.0のクラスは: ", 0.0.class, "\n"
print "trueのクラスは: ", true.class, "\n"
print "falseのクラスは: ", false.class, "\n"
print "nilのクラスは: ", nil.class , "\n"

puts "\#1.1.2 ブロックとイテレータ"
#イテレータ
3.times{ print "Ruby! \n" }
1.upto(9){ |x| print x }
puts ""
#配列
a = [ 1, 2, 3 ]

#each
a.each do |elt|
	print elt + 1
end
puts ""

#map
puts "ここから階乗"
puts b = a.map{ |x| x*x }
puts "偶数を抽出"
puts c = a.select { |x| x%2==0 }
puts "総和を計算?"
a.inject do |sum,x|
	sum + x
end 

#ハッシュ
puts "ハッシュ"
h = { :one => 1, :two => 2 }
h[:one]
h[:three] = 3
h.each do |key, value|
	print "#{value}:#{key};,\n"
end

#ファイル
puts "ファイル操作"
File.open("data.txt") do |f|
	line = f.readline
	puts line
end

#1.1.3 Rubyの式と演算
x = 1
y = 2
minimum = if x < y then x else y end
print "minimum: ", minimum, "\n"

#演算子
print "1 + 2 = ", 1+2, "\n"
print "1 * 2 = ", 1*2, "\n"
print "1 + 2 == 3 :", 1+2==3, "\n"
print "2 **1024 = ", 2**1024, "\n"
print "\"Ruby\" + \"rock!\" -> ", "Ruby" + "rock!", "\n"
print "\"Ruby!\" * 3 = ", "Ruby!"*3, "\n"
print "%d %s" % [3, "rubies" ], "\n"
print max = x > y ? x : y, "\n"

puts"\#1.1.4 メソッド"
puts "階乗する。"
def square(x)
        x*x
end
puts square(4)

puts "\#1.1.5 代入"
puts "直行座標を極座標にする。"
def polar(x, y)
	theta = Math.atan2(y, x)
	r = Math.hypot(x, y)
	[r, theta]
end
puts polar(1, 1)

puts "多重代入→表示"
distance, angle = polar(2, 2)
print "distance: ", distance, "\n", "angle: ", angle, "\n"

puts "\#1.1.7 正規表現と範囲"

#生年に基づいて米国での世代名を判定する。
#case式は===で範囲テストする。
birthyear = 1988
generation = case birthyear
		when 1946..1963; "Baby Boomer"
		when 1964..1976; "Generation X"
		when 1978..2000; "Generation Y"
		else nil
		end
puts generation

#ユーザに何かを確かめるためのメソッド
def are_you_sure?
	while true
		print "よろしいですか？ [y/n]: "
		response = gets
		case response
		when /^[yY]/
			return true
		when /^[nN]/, /^$/
			return false
		end
	end
end

are_you_sure?

puts "\#1.1.8 クラスとモジュール(クラスはsequence.rb)"
module Sequences
	def self.fromtoby(from, to, by)
		x = from
		while x <= to
			yield x
			x += by
		end
	end
end

Sequence.fromtoby(1, 10, 2){|x|  print x }

