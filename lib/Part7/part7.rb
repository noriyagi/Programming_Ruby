#第７章　クラスとモジュール
class Point
	def initialize(x,y)
		@x, @y = x, y
	end

	def to_s
		"(#@x,#@y)"
	end

#	def x
#		@x
#	end

	def x; @x; end
#
#	def y
#		@y
#	end

	def y; @y; end

end

p = Point.new(1,1)
p1 = Point.new(0,0)

puts p.class
puts p.is_a? Point

p2 = Point.new(1,2)
q  = Point.new(p2.x*2, p2.y*3)
p q

class MutablePoint

	attr_reader :x, :y

	def initialize(x,y); @x,@y = x,y; end

	def +(other)
		raise TypeError, "Point argument expected" unless
		other.respond_to? :x and other.respond_to? :y

		Point.new(@x + other.x, @y + other.y)
	end

	def -@
		Point.new(-@x, -@y)
	end

	def *(scalar)
		Point.new(@x*scalar, @y*scalar)
	end

#	def x; @x; end
#	def y; @y; end

#	def x=(value)
#		@x = value
#	end

#	def y=(value)
#		@y = value
#	end

	def coerce(other)
		[self, other]
	end

	def [](index)
		case index
		when 0, -2; @x
		when 1, -1; @y
		when :x, "x"; @x
		when :y, "y"; @y
		else nil
		end
	end

	def each
		yield @x
		yield @y
	end

	def ==(o)
		if o.is_a? Point
			@x==o.x && @y==o.y
		else
			false
		end
	end
	
	def hash
		code = 17
		code = 37*code + @x.hash
		code = 37*code + @y.hash
		code
	end

	include Comparable

	#原点からの距離に基づいてPointの順序を定義する。	
	def <=>(other)
		return nil unless other.instance_of? Point
		@x**2 + @y**2 <=> other.x**2 + other.y**2
	end

	#ミュータブルなadd
	def add!(p)
		@x += p.x
		@y += p.y
		self
	end

	def add(p)
		p = self.dup
		p.add!(p)
	end

#classの終わりのend
end

m = MutablePoint.new(1,1)
m.x = 0
m.y = 0
p m
p = Point.new(1,2)
p.each{|x| print x}
print "\n"

#7.1.12 手っ取り早いミューテータクラス
#Struct.new("Spoint", :x, :y)
Spoint = Struct.new(:x, :y)
class Spoint
	def add!(other)
		self.x += other.x
		self.y += other.y
		self
	end
	include Comparable
	def <=>(other)
		return nil unless other.x**2 + other.y**2
	end
end

p = Spoint.new(1,2)
p p.x
p p.y
p p.x = 3
p p.x

p p[:x] = 4
p p[:x]
p p[1]
p.each{|c| print c}
print "\n"
p.each_pair{|n,c| print n,c}
print "\n"

q = Spoint.new(4,2)
p q == p
h = {q => 1}
p h[p]
p q.to_s

class Ppoint
	attr_reader :x,:y

	def self.sum(*points)
		x = y = 0
		points.each{|p| x +=  p.x; y += p.y}
		Ppoint.new(x,y)
	end
end

#total = Ppoint.sum(p1,p2,p3)

#Ppointオブジェクトをオープンして、メソッドを追加できるようにする。
#class << Ppoint
#	def sum(.......... 


