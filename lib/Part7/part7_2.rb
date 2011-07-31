#第7章2週目　クラスとモジュール
class Point

	#attr_accessor :x, :y
	attr_reader :x, :y

	#7.1.15 クラス変数
#	@@n = 0
#	@@totalX = 0
#	@@totalY = 0
	
	#7.1.16 クラスインスタンス変数
	@n = 0
	@totalX = 0
	@totalY = 0

	#7.1.3 Pointの初期化
	def initialize(x,y)
		@x, @y = x, y

#		@@n += 1
#		@@totalX += x
#		@@totalY += y
	end

	#7.1.14 定数
#	ORIGIN = Point.new(0,0)
#       UNIT_X = Point.new(1,0)
#       UNIT_Y = Point.new(0,1)

	#新しいPointオブジェクトを作るクラスメソッド
	def self.new(x,y)
#		@n += 1
#		@totalX += x
#		@totalY += y

		super       #チェイニンング？
	end

	#集計結果を報告するクラスメソッド
	def self.report
#		puts "生成された点の数： #@@n"
#		puts "X軸方向の平均： #{@@totalX.to_f / @@n}"
#		puts "Y軸横行の平均： #{@@totalY.to_f / @@n}"
                
		#クラスインスタンス変数を使った処理
		puts "生成された点の数： #@n"
		puts "X軸方向の平均： #{@totalX.to_f / @n}"
		puts "Y軸横行の平均： #{@totalY.to_f / @n}"
	end
	
	#7.1.4 to_sメソッドの定義
	def to_s
		"(#@x, #@y)"      #文字列のなかにインスタンス変数を展開している。
	end

	#アクセッサと属性         -> attr_readerによる置き換え
#	def x
#		@x
#	end
#	
#	def y
#		@y
#	end
#
	def x=(value)
		@x = value
	end

	def y=(value)
		@y = value
	end

	#7.1.6 演算子の定義
#	def +(other)          #ベクトルの加算
#		Point.new(@x + other.x, @y + other.y)   #ここで使っている@x,@yはselfのインスタンス変数
#	end						#さらにother側はゲッターメソッドを介している。
#
#	def -@                #座標の符号を反転
#		Point.new(-@x, -@y)
#	end
#
#	def *(scalar)
#		Point.new(@x*scalar, @y*scalar)
#	end

	#7.1.8 座標の数え上げ
	def each                   #eachメソッドを実装した事によりEnumerableモジュールのミックスインが可能
		yield @x
		yield @y
	end

	def <=>(other)             #<=>メソッドを実装したことによりComparableモジュールをミックスインできる。
		return nil unless other.instance_of? Point
		@x**2 + @y**2 <=> other.x**2 + other.y**2
	end

	#7.1.13 クラスメソッド
	def Point.sum(*points)
		x = y = 0
		points.each{|p| x += p.x; y += p.y}
		Point.new(x,y)
	end
end

p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)
p p.class
p p.is_a? Point
puts p        #(1,2)
puts q        #(2,6)

q.x = 0       #インスタンス変数にアクセス
q.y = 0
puts q        #(0,0)

p.each{|x| puts x}

#外からクラスメソッドを実装するには？
#class << Point	#Pointオブジェクトをオープンしてメソッドを追加する。
#	def sum(*points)
#		x = y = 0
#		points.each{|p| x += p.x; y += p.y;}
#		Point.new(x,y)
#	end
#end

class << self
	attr_accessor :n, :totalX, :totalY
end


#7.3 サブクラス化と継承
class Point3D < Point
end

p2 = Point.new(1,2)
p3 = Point3D.new(1,2)
print p2.to_s, p2.class, "\n"
print p3.to_s, p3.class, "\n"


#メソッドのオーバーライド
class WorldGreeter
	def greet
		puts "#{greeting} #{who}"
	end

	def greeting
		"Hello"
	end

	def who
		"World"
	end
end

#スペイン版
class SpanishWorldGreeter < WorldGreeter
	def greeting
		"HOla"
	end
end

SpanishWorldGreeter.new.greet

 
