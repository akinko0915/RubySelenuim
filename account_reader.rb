# frozen_string_literal:true

require 'json'

def read_account(filename)
    File.open(filename) do |file|
        JSON.parse(File.read(file),symbolize_names: true)
        # 開いたファイルのデータをreadをすべて読み込み、JSON.parseでRubyのハッシュに変換した。symbolize_names: trueオプションを指定すると、ハッシュキーはrubyのシンボルに変換される。
    end
end

if __FILE__ == $PROGRAM_NAME
# このファイルを実行した時は、この行以降のプログラムも実行される
    account = read_account(ARGV[0])
    # プログラム実行時に、コマンドラインでアカウント情報のファイル名を指定する。プログラム中では最初の引数はARGV[0]で参照できる。read_accountで読み込んだ結果を変数accountで参照する
    p account
    # デバッグに使うｐメソッドで、accountの内部要素を表示した。
    puts account[:email]
    puts account[:password]
end