#1.1.8 クラスとモジュール
#
#３つのパラメータによって作られる数列を表現
#
# x = from + n*by  :nは整数
#
#
class Sequence

	#Enumerableモジュールのメソッドを取り込む
	include Enumerable
	
	def initialize(from, to, by)
	#パラメータを保持させる。
		@from, @to, @by = from, to, by
	end

	#each を定義？
	#末尾に到達するまでイテレータブロックに"x"を渡す。
	def each
		x = @from
			while x <= @to
			yield x
			x += @by
		end
	end

	#数列中の値の個数を調べる。
	def length
		return 0 if @from > @to
		Integer((@to-@from)/@by) + 1
	end

	#同じメソッドに対して違う名前を付ける
	alias size length

	#数列へのランダムアクセスを許容するため、演算子をオーバーライドする。
	def [](index)
		return nil if index < 0
		v = @from + index*@by
		if v <= @to
			v
		else
			nil
		end
	end

	#新しいSequenceオブジェクトを返すように算術演算子をオーバーライドする。
	def *(factor)
		Sequence.new(@from*factor, @to*factor, @by*factor)
	end

	def +(offset)
		Sequence.new(@from+offset, @to+offset, @by)
	end
end

#実行
s = Sequence.new(1, 10, 2)
s.each{|x| print x }
puts ""
print s[s.size-1], "\n"
t = (s+1)*2
t.each{|x| print x}
puts ""

