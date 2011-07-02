#3.1.3
require 'rational'
print 5/2, " ", 5.0/2, " ", 5/2.0, "\n"
print 5.0.div(2), " ", 5.0.div(2), " ", 5.quo(2), "\n"

puts x = 5%2
q, r = 10.divmod 3
puts q
puts r

a = 2
puts a**4
puts a**-1
puts a**(1/3.0)

#3.1.4
puts 0.4 - 0.3

#3.2
#3.2.1.1 シングルクォート
print 'O\'Reillyの本を読みませんか？', "\n"
print 'この文字列リテラルの末尾は、単一のバックスラッシュ：\\', "\n"
print 'これはバックスラッシュとクォート：\\\'', "\n"
print 'これは２個のバックスラッシュ：\\\\', "\n"
print 'これは、バックスラッシュと改行を含んだコード\
<-ここにあるよ！シングルクォートでは改行のエスケープできない。', "\n"

#3.2.1.2 ダブルクォート
print "\t\"この引用は、先頭がタブで末尾が改行。\"\n"
print "360° = #{2*Math::PI} ラジアン", "\n"

#3.2.1.4 セパレータ
puts %q( 文字のエスケープは考えなくて良い。)
puts %Q|"元気？"と彼は言った。|

#3.2.1.5 ヒアドキュメント
document = <<HERE
これは文字列リテラル
２行あるよん。
HERE
puts document

greeting = <<HERE + <<THERE + "World!"
Hello
HERE
There
THERE
puts greeting

document2 = <<'ここが文字列の終わり。'
a'
a'
a'
a'
ここが文字列の終わり。
puts document2

#3.2.1.6 バッククォート
puts `ls`
puts %x[ls]

#3.2.1.7 ミュータブルな文字列リテラル（時間概念、状態、アイデンティティをもつ）
10.times { puts "test".object_id }





