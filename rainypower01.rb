#frozen_string_literal: true

require 'open-uri' 
#open-uriライブラリを使うための宣言

URI.open('https://rainypower.jp/') do |f|
    f.each_line do |line|
        puts line
    end
end 

#URLを指定してWebサイトを開く、Webサイトから得た情報を、ローカル変数ｆで参照する
#each_lineメソッドを使ってWebサイトから1行分のデータを読む。ローカル変数lineでデータを参照する