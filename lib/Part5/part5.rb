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
	when 1 
	 "one"
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

