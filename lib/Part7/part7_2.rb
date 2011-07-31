#第7章2週目　クラスとモジュール
class Point

	#attr_accessor :x, :y
	attr_reader :x, :y


	#7.1.3 Pointの初期化
	def initialize(x,y)
		@x, @y = x, y
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
#	def x=(value)
#		@x = value
#	end
#
#	def y=(value)
#		@y = value
#	end

	#7.1.6 演算子の定義
	def +(other)          #ベクトルの加算
		Point.new(@x + other.x, @y + other.y)   #ここで使っている@x,@yはselfのインスタンス変数
	end						#さらにother側はゲッターメソッドを介している。

	def -@                #座標の符号を反転
		Point.new(-@x, -@y)
	end

	def *(scalar)
		Point.new(@x*scalar, @y*scalar)
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


