#第9章　Rubyプラットフォーム
#9.1 文字列
s = "hello"
puts s.concat(" world")     #文字列を返して新しいsを返す。
puts s.insert(5, " there")  #5桁目に追加する。
puts s.slice(0,5)           #0から5けた表示
puts s                        
puts s.slice!(5,6)          #削除された文字列部分を返す。5桁目から6桁。
puts s.eql?("hello world")

puts s.length
puts s.size
#puts s.bytesize
puts s.empty?
puts "".empty?

s = "hello"
#パターンマッチ
puts s.index('l')
puts s.index(?l)
puts s.index(/l+/)
puts s.index('l',3)
puts s.index('Ruby')
puts s.rindex('l')
puts s.rindex('l',2)

#プレフィックス、サフィックスのチェック
#s.start_with? "hell"
#s.end_with? "bells"

#部分配列があるか？
puts s.include?("ll")
puts s.include?(?H)

#正規表現とのパターンマッチ
puts s =~ /[aeiou]{2}/  #２重母音があるか?
#s.match(/[aeiou]/){|m| m.to_s}

#区切り文字、パターンに基づいて文字列を部分配列に分割
p "this is it".split
p "hello".split('l')
p "1, 2,3".split(/,\s*/)  #カンマ+space (0以上)のパターン

#指定された文字列、パターンを検索し、＜最初のみ、全部＞置換する。
puts s.sub("l", "L")
puts s.gsub("l", "L")
puts s.sub!(/(.)(.)/, '\2\1')
puts s.sub!(/(.)(.)/, "\\2\\1")
#s.gsub(/[aeiou]/, "a"=>0, "e"=>1, "i"=>2)

#ブロックで文字列操作
puts "hello world".gsub(/\b./){|match| match.upcase}

#大文字／小文字を変更するメソッド
s = "world"
puts s.upcase
puts s.upcase!
puts s.downcase
puts s.capitalize
puts s.capitalize!
puts s.swapcase

#大文字／小文字を区別しない比較
puts "world".casecmp("WORLD")
puts "a".casecmp("B")

#改行を編集
s = "hello\r\n"
puts s.chomp!  #改行削除
puts s.chomp   #改行記号がないので変更なし
puts s.chomp!  #nil 変更なしの意味
puts s.chomp("o")  #末尾から"o"を取り除く
#$/ = ";"   #グローバルレコードセパレータを";"に変更
#puts "hello;".chomp  #chompは末尾の";"を検出するようになった。

#chop 末尾の文字か改行記号（"\n","\r","\r\n")を削除する。）
s = "helo\n"
puts s.chop!
puts s.chop
puts "".chop
puts "".chop!

#右側、左側の空白を削除
s = "\t hello \n"
puts s.strip
puts s.lstrip
puts s.rstrip

#n字幅のフィールドに文字列を右、左、中央揃え
s = "x"
puts s.ljust(3)
puts s.rjust(3)
puts s.center(3)
puts s.center(5, '-')  #スペースをパディングできる。
puts s.center(7, '-=')

#バイト単位／行単位イテレータ
s = "A\nB"
s.each_byte{|b| print b, " "}
print "\n"
s.each_line{|l| print l.chomp}
print "\n"

#s.each_char{|c| print c, " "}

#数字と文字列
puts "10".to_i
puts "10".to_i(2)
puts "10x".to_i
puts " 10".to_i
puts "ten".to_i  #不適切な入力でも例外を起こさない
puts "10".oct
puts "10".hex
puts " 1.1 dozen".to_f
puts "6.02e23".to_f
puts "one".to_sym
puts "two".intern

#文字列のインクリメント
puts "a".succ
puts "aaz".next
puts "a".upto("e"){|c| print c }

#文字列の反転
puts "hello".reverse

#デバッグ
puts "hello\n".dump
puts "hello\n".inspect

#変換
puts "hello".tr("aeiou", "AEIOU")
puts "hello".tr("aeiou", " ")
puts "bead".tr_s("aeiou", " ")  #変換して重複を削除

#チェックサム
puts "hello".sum
puts "hello".sum(8)
puts "hello".crypt("ab")

#文字計算、削除、重複削除
puts "hello".count('aeiou')
puts "hello".delete('aeiou')
puts "hello".squeeze('a-z')

#複数の引数がある場合は積集合をとる。
#先頭が"^"の引数は逆を表す。背反？
puts "hello".count('a-z', '^aeiou')  #"a-z"のあいだで"aeiou"以外
puts "hello".delete('a-z', '^aeiou')  #母音以外削除

#9.1.1 文字列の整形
n, animal = 2, "mice"
puts "#{n+1} blind #{animal}"

printf('%d blind %s', n+1, animal)
print "\n"
printf('%d blind %s' %[n+1, animal])
print "\n"

#整数の整形
puts '%d' % 10
puts '%x' % 10
puts '%X' % 10
puts '%o' % 10
puts '%f' % 1234.567
puts '%e' % 1234.567
puts '%E' % 1234.567
puts '%g' % 1234.567
puts '%g' % 1.23456E12

#フィールド幅
puts '%5s' % '<<<'  #右揃え
puts '%-5s' % '>>>' #左揃え
puts '%5d' % 123    #5字幅のフィールド
puts '%05d' % 123   #0詰め

#精度
puts '%.2f' % 123.456
puts '%.2e' % 123.456
puts '%.6e' % 123.456
puts '%.4g' % 123.456

#フィールド指定と精度の組み合わせ
puts '%6.4g' % 123.456   #6字幅フィールドに有効数字4桁
puts '%3s' % 'ruby'
puts '%3.3s' % 'ruby'

#整形される複数の引数
args = ['Syntax Error', 'test.rb', 20]  #引数配列
puts "%s: in '%s' line %d" % args
 
#9.1.2 バイナリ文字列のパック／アンパック
p a = [1,2,3,4,5,6,7,8,9,10]
p b = a.pack('i10')     #10個の4バイト整数をバイナリ文字列にパック
p c = b.unpack('i*')     #"*"は全て
puts c == a

m = 'hello world'
p data = [m.size, m]
puts template = 'Sa*'
puts b = data.pack(template)
puts b.unpack(template)

#9.2 正規表現
#9.2.1 世紀表現リテラル
# /Ruby?/  Rubの後ろに、"y"が一つか二つ。
# /ruby?/i 大文字／小文字を区別しない。
# /./mu    複数行でUnicodeにマッチする。

# %r|/|
# %r[</(.*)>]i

money = /[$\u20AC\u{a3}\u{a5}]

prefix = ","
/#{prefix}\t/

#9.2.2 正規表現ファクトリメソッド
Regexp.new("Ruby?")
Regexp.new("ruby?",Regexp::IGNORECASE)
Regexp.compile(".",Regexp::MULTILINE,"u")

pattern = "[a-z]+"  #１個以上の文字
suffix = Regexp.escape("()")  #かっこをエスケープしている。
p r = Regexp.new(pattern + suffix)  #=> /[a-z]+\(\)/

#5つの言語名のどれかにマッチする
p pattern = Regexp.union("Ruby", "Perl", "Python", /Java(Script)?/)
#かっこのどれかにマッチする => 自動的にエスケープされる。
p Regexp.union("()", "[]", "{}")

#9.2.3 正規表現の構文
#9.2.4 正規表現によるパターンマッチング
pattern = /Ruby?/i  #"Rub","Ruby"にマッチ
puts pattern =~ "backrub"
puts "rub ruby" =~ pattern
puts pattern =~ "r"

puts "hello" =~ /e\w{2}/  #"e"の後ろに2文字
puts $~.string
puts $~.to_s
puts $~.pre_match
puts $~.post_match


#3個の部分式を持つ正規表現
puts pattern = /(Ruby|Perl)(\s+)(rocks|sucks)!/
text = "Ruby\trocks!"
puts pattern =~ text
puts data = Regexp.last_match
puts data.size
puts data[0]
puts data[1]
puts data[2]
puts data[3]
p data[1,2]
p data[1..3]
p data.values_at(1,3)
p data.captures
p Regexp.last_match(3)

#マッチの先頭、末尾の位置
puts data.begin(0)  #マッチ全体の先頭位置
puts data.begin(2)  #第二の部分式にマッチした部分の先頭位置
puts data.end(2)    #第二の部分式にマッチした部分の末尾位置
puts data.offset(3) #第三の部分式にマッチした部分の先頭／末尾

#9.2.4.2 文字列によるパターンマッチ
#マッチした部分が返される
puts "ruby123"[/\d+/]
puts "ruby123"[/([a-z]+)(\d+)/,1]
puts "ruby123"[/([a-z]+)(\d+)/,2]

puts r = "ruby123"
puts r.slice!(/\d+/)
puts r

s = "one, two, three"
p s.split  #デフォルトのセパレータはスペース
p s.split(", ")
p s.split(/\s*,\s*/)  #カンマの前後に任意個のスペース

#indexメソッド　マッチングの開始位置を指定できる。
text = "hello world"
pattern = /l/
puts first = text.index(pattern)
puts n = Regexp.last_match.end(0)  #最初のマッチの末尾の位置
puts second = text.index(pattern, n)
puts last = text.rindex(pattern)

#9.2.4.3 置換
#phone = gets
#phone.sub!(/#.*$/, "")
#phone.gsub!(/\D/, ' '=>'-')

p text = "Hello rails snd grails"
p text.gsub("rails", "Rails")
p text.gsub(/\brails\b/, "Rails")

p text.gsub(/\brails\b/i, '<b>\0</b>')

#9.3b 数値と数学
#9.3.1 Numericのメソッド

#一般的な記述
p 0.zero?
p 1.0.zero?
p 0.0.nonzero?
p 1.nonzero?
p 1.integer?
p 1.0.integer?
#p 1.real?
#p 1.0.real?
#p Complex(1,2).real?

#Integerの記述
#p 0.even?
#p 0.odd?

#Floatの記述
ZERO, INF, NAN = 0.0, 1.0/0.0, 0.0/0.0

p ZERO.finite?
p INF.finite?
p NAN.finite?
p ZERO.infinite?
p INF.infinite?
p -INF.infinite?
p NAN.infinite?

p ZERO.nan?
p INF.nan?
p NAN.nan?

#丸めメソッド
p 1.1.ceil
p -1.1.ceil
p 1.9.floor
p -1.9.floor
p 1.1.round
p 0.5.round
p -0.5.round
p 1.1.truncate
p -1.1.to_i



