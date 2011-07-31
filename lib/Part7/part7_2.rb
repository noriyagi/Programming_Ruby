#第7章2週目　クラスとモジュール
class Point

	#attr_accessor :x, :y
	#attr_reader :x, :y


	#7.1.3 Pointの初期化
	def initialize(x,y)
		@x, @y = x, y
	end
	
	#7.1.4 to_sメソッドの定義
	def to_s
		"(#@x, #@y)"      #文字列のなかにインスタンス変数を展開している。
	end

	#アクセッサと属性
	def x
		@x
	end
	
	def y
		@y
	end

	def x=(value)
		@x = value
	end

	def y=(value)
		@y = value
	end
end

p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)
p p.class
p p.is_a? Point
puts p
puts q

q.x = 0       #インスタンス変数にアクセス
q.y = 0
puts q


