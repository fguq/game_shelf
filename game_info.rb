require "date"
require "csv"

class GameInfo

  def initialize
    @game_list = []
    @separator = "---------------------------------------------------"
  end
  
  # 登録機能
  def registration
    puts "\nゲームを登録します。必要な情報を入力してください。"
    puts @separator
    print "タイトル："
    title = gets.chomp
    print "ハード："
    hardware = gets.chomp
    print "メーカー："
    maker = gets.chomp

    begin
      print "購入日："
      purchase_date = Date.parse(gets.chomp)
    rescue
      puts "正しい日付を入力してください。"
      retry
    end

    begin
      print "評価：(0～5の半角整数で入力してください。) >"
      star = gets.chomp
      until Integer(star).between?(0, 5)
        print "評価：(0～5の半角整数で入力してください。) >"
        star = gets.chomp
      end
    rescue
      retry
    end

    puts "備考（20字まで）："
    note = gets.chomp
    while note.length > 20
      puts "現在#{note.length}字です。もう一度入力してください。"
      note = gets.chomp
    end

    CSV.open("./game_list.csv", "a") do |item|
      item << [title, hardware, maker, purchase_date, star, note]
    end

    puts "登録しました。"
    back_menu
  end
  
  # 一覧表示機能
  def display
    puts "\n登録されたゲーム一覧"
    puts @separator

    # あとでtableでの処理に直す
    CSV.foreach("./game_list.csv", headers: true) do |game|
      puts "タイトル：#{game["title"]}"
      puts "ハード：#{game["hardware"]}"
      puts "メーカー：#{game["maker"]}"
      puts "購入日：#{game["purchase_date"]}"
      print "評価："
      puts sprintf( "%-*s", 5,  "★" * game["star"].to_i).gsub(" ", "☆").gsub("★", "★ ").gsub("☆", "☆ ")
      puts "備考：#{game["note"]}"
      puts @separator
    end
    back_menu
  end

  # 削除機能
  def game_delete
    game_table = CSV.table("./game_list.csv")

    if game_table[0] == nil
      puts "登録されているゲームがありません。"
      back_menu
    else
      puts "\n登録されたゲームを削除します。削除したいゲームの番号を選んでください。"
      puts @separator
      n = 0
      game_table.each do |game|
        n += 1
        puts "#{n} : #{game[:title]}"
      end
      puts @separator
      begin
        print "番号を入力してください。"
        delete_num = gets.chomp
        until Integer(delete_num).between?(1, n)
          print "正しい番号を入力してください。"
          delete_num = gets.chomp
        end
      rescue
        retry
      end

      print "本当に「#{game_table[delete_num.to_i - 1][:title]}」を削除しますか？削除する場合は y キーを押してください。> "
      key = gets.chomp
      if key == "y"
        puts "#{game_table[delete_num.to_i - 1][:title]}を削除しました。"

        game_table.delete(delete_num.to_i - 1)

        File.open("./game_list.csv", "w") do |file|
          file.write(game_table.to_csv)
        end
        
        puts "メニューに戻ります。"
      else
        puts "メニューに戻ります。"
      end
      back_menu
    end
  end

  # プログラムの終了
  def game_shelf_end
    puts "プログラムを終了します。"
    puts "（データは保存されません。データの保存機能は近日実装予定です。）"
    gets.chomp
  end

  # メインメニュー
  def run
    puts "\n#{@separator}"
    puts "所持ゲーム管理ツール"
    puts @separator
    puts "1.ゲームの登録"
    puts "2.登録したゲームの一覧"
    puts "3.登録したゲームの削除"
    puts "4.プログラムを終了する"
    puts "(使いたい機能の番号を入力してください)"
    print ">"
    function = gets.chomp.to_i

    # 不正な数字が入力された場合の処理
    until function == 1 || function == 2 || function == 3 || function == 4
      puts "(1～4の数字を入力してください。)"
      print ">"
      function = gets.chomp.to_i
    end

    # 各機能への分岐
    case function
    when 1
      registration
    when 2
      display
    when 3
      game_delete
    when 4
      game_shelf_end
    end
  end

  def back_menu
    puts @separator
    print "メインメニューに戻る（エンターキー) >"
    gets.chomp
    run
  end
end
