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



