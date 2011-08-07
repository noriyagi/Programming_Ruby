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




