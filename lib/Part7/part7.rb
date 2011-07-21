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


end

m = MutablePoint.new(1,1)
m.x = 0
m.y = 0
p m
p = Point.new(1,2)
p.each{|x| print x}
print "\n"


