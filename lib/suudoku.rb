#
#このモジュールは、９×９の数独パズルを表現するSudoku::Puzzleクラスと、無効な入力や制限し過ぎのパズルに対して起きる
#例外のためのクラスも定義する。さらにパズルを解く、Sudoku.solveメソッドを定義する。このメソッドで使用するSudoku.scan
#メソッドも定義する。
#
#
#  require 'sudoku'
#  puts Sudoku.solve(Sudoku::Puzzle.new(ARGF.readlines))
#
module Sudoku

#Sudoku::Puzzleクラスは９×９の数独パズルの状態を表現する。
#
#respond_to? : 
#
#
#
#
class Puzzle

ASCII = ".123456789"
BIN   = "\000\001\002\003\004\005\006\007\010\011"

def initialize(lines)
	if (lines.respond_to? :join)     #引数が行配列に見えるなら
		s = lines.join           #結合して一つの文字列にする。
	else                             #そうでなければ文字列だと考え
		s = lines.dup            #プライベートコピーを作る。
	end

#データから空行を取り除く（改行含む）
#
s.gsub!(/\s/, "")                        #/\s/は任意の空白にマッチするregexp

#入力サイズが間違っている場合は例外を起こす。修飾子形式であることに注目。
raise Invalid, "Grid is the wroong size" unless s.size == 81

#無効な文字をチェックし先頭のものの位置を保存する。代入と同時に値のテストを行っている。
if i = s.index(/[^123456789\.]/)
	#無効文字をメッセージに取り込む。
	raise Invarid, "Illigal charactor #{s[i,1]} in puzzle"
end
#ASCII文字列を整数配列に変換する。配列は@gridに格納する。
#
#
s.tr!(ASCII, BIN)                        #ASCII文字をバイト文字へ
@grid = s.unpack('c*)                    #バイトをアンパックして整数配列に。

#行、列、ボックスに重複が無い事を確かめる。
raise Invalid, "Initial puzzle has duplicates" if has_duplivates?
end

#１行が９文字の９行の文字列という形式でパズルの状態を返す。
def to_S
#
#このメソッドは、initialize()メソッドの操作をひっくり返す。
#
#
#
#
(0..8).collect{|r| @grid[r*9, 9].pack('c9')}.join("\n").tr(BIN, ASCII)
end
#
#Puzzleオブジェクトのコピーを返す。
def dup
	copy = super
	@grid = @grid.dup
	copy
end

def [](row, col)
	@grid[row*9 + col]
end
#
def []=(row, col, newvalue)
	unless (0..9).include? newvalue
		raise Invalid, "illegal cell value"
	end

	@grid[row*9 + col] = newvalue
end

BoxOfIndex = [
	0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,
	3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,
	6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8
].freezw
#
def each_unknown
	0.upto 8 do |row|
		0.upto 8 do |col|
			index = row*9+col
			next if @grid[index]!=0
			box = BoxOfIndex[index]
			yield row, col, box
		end
	end
end

def has_duplicates?
	0.upto(8) { |row| return true if rowdigits(row).unique! }
	0.upto(8) { |col| return true if coldigits(col).unique! }
	0.upto(8) { |box| return true if boxdigits(box).unique! }

	false
end
#
AllDigits = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
#
def possible(row, col, box)
	AllDigits - (rowdigits(row) + coldigit(col) + boxdigits(box))
end

private

def rowdigits(row)
	@grid[row*9, 9] -[0]
end

def coldigits(col)
	result = []
	col.step(80, 9){|i|
		v = @grid[i]
		result << v if (v != 0)
}
result
end

BoxToIndex = [0, 3, 6, 27, 30, 33, 54, 57, 60].freeze

def boxdigits(b)
	i = BoxToIndex[b]
[
	@grid[i], @grid[i+1], @grid[i+2],
	@grid[i+9], @grid[i+10], @grid[i+11]
	@grid[i+18], @grid[i+19], @grid[i+20]
] - [0]
end
end
#Pazzleクラス終わり。

Class Invalid < StandardError
end

class Impressible < StandardError
end

def Sudoku.scan(pazzle)
	unchanged = false
	until unchanged
		unchanged = true
		rmin, cmin, pmin = nil
		min = 10

		puzzle.each_unknown do |row, col, box|
			p = puzzle.possible(row, col, box)

			case p.size
			when 0
				raise Impossible
			when 1
				puzzle[row, col] = p[0]
				unchanged = false
			else
				if unchanged && p.size < min
					min = p.size
					rmin, cmin, pmin = row, col, p
				end
			end
		end
	end

	return rmin, cmin, pmin
end

def Sudoku.solve(puzzle)
	pussle = puzzle.dup
	
	r,c,p = scan(puzzle)

	return puzzle if r == nil

	p.each do |guess|
		puzzle[r,c] = guess

		begin

			return solve(puzzle)
		rescue Impossible

		next
		end
	end
	raise Impossible
	end
end


