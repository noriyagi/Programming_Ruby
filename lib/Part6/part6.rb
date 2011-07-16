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
#       max = first
#       rest.each{|x| max = x if x > max}
#       max
#end

#p max(1)
#p max(1,2)
#p max(1,2,3)

#6.4.2.1 メソッドの配列引数
#data = [3,2,1]
#m = max(*data)


#6.4.4 名前付き引数のハッシュ
def sequence(args)
	n = args[:n] || 0
	m = args[:m] || 1
	c = args[:c] || 0
	a = []
	n.times {|i| a << m*i+c }
	a
end

seq = sequence({:n=>3, :m=>5})
p seq

seq = sequence(:m=>3, :n=>5)
p seq

#6.4.5 ブロック引数
def sequence2(n,m,c)
	i = 0
	while(i < n)
		yield i*m+c
		i += 1
	end
end

seq = sequence2(5,2,2){|x| puts x }
p seq

def sequence3(n,m,c,&b)
	i = 0
	while(i < n)
		b.call(i*m+c)
		i += 1
	end
end

seq = sequence3(5,2,2){|x| puts x }
p seq

def sequence4(n,m,c,b)
	i = 0
	while(i < n)
		b.call(i*m+c)
		i += 1
	end
end

p = Proc.new {|x| puts x}
seq = sequence4(5,2,2,p)
p seq

def sequence5(args, &b)  #引数をハッシュで渡し、ブロックを続ける
	n,m,c = args[:n], args[:m], args[:c]
	i = 0
	while(i < n)
		b.call(i*m+c)
		i += 1
	end
end

def max(first, *rest, &block)
	max = first
	rest.each{|x| max = x if x > max}
	block.call(max)
	max
end

#6.4.5.1 メソッド呼び出しにおける &
a, b = [1,2,3],[4,5]
#sum = a.inject(0){|total,x| total + x}
#sum = b.inject(sum){|total,x| total + x}  #Rubyインタプリタが２回ブロック解析をする。
#p sum

#summation = Proc.new{|total2,x2| total2 + x2}
#sum2 = a.inject(0, &summation)
#sum2 = b.inject(sum2, $summation)          #Rubyインタプリタは１回ブロック解析をすれば良くなる。
#p sum2

#words = ['and', 'but', 'car']
#uppercase = words.map &:upcase
#upper = words.map{|w| w.upcase}

#6.5 Proc
#6.5.1 Proc の作り方
def makeproc(&p)
	p
end

adder = makeproc{|x,y| x+y}

p sum = adder.call(2,2)

#6.5.1.1 Proc.new
p = Proc.new{|x,y| x+y}

def invoke(&b)
	b.call
end

def invoke2
	Proc.new.call
end

#6.5.2 Proc の実行
x = 1
y = 2
f = Proc.new{|x,y| 1.0/(1.0/x + 1.0/y)}
p z = f.call(x,y)

p z = f[x,y]
#p z = f.(x,y)

#6.5.3 Procの項数
p lambda{||}.arity
p lambda{|x| x}.arity
p lambda{|x,y| x+y}.arity

#6.5.4 Proc の等値性	
p lambda{|x| x*x } == lambda{|x| x*x}

p = lambda{|x| x*x}
q = p.dup
p p == q
p p.object_id == q.object_id

#6.5.5 procとlambdaの違い
#6.5.5.1 ブロックやProc内のreturn
def test
	puts "entering method"
	1.times{ puts "entering block" ; return}
	puts "exiting method"   #この行は無効
end
test

def test2
	puts "entering method"
	p = Proc.new{ puts "entering block" ; return}
	p.call
	puts "exiting method"
end
test2

def procBuilder(message)
	Proc.new{ puts message; return}
end

def test3
	puts "entering method"
	p = procBuilder("entering proc")
	puts "ここまできてる"	
#	p.call
	puts "exiting method"
end
test3

def test4
	puts "entering method"
	p = lambda{ puts "entring lambda"; return}
	p.call                                          #lambda内のreturnは、lambdaを抜けるだけ
	puts "exiting method"
end
test4

def lambdaBuilder(message)
	lambda{ puts message; return}
end

def test5
	puts "entering method"
	l = lambdaBuilder("entering lambda")
	l.call
	puts "exiting method"
end
test5

