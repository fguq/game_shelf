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
      print "評価：(0～5の半角整数で入力してください。) >"
      star = gets.chomp
      until Integer(star).between?(0, 5)
        print "評価：(0～5の半角整数で入力してください。) >"
       star = gets.chomp
      end
    rescue
      retry
    end
    @game_info = [title, hardware, maker, star]
    @game_list << @game_info
    puts "登録しました。"
    back_menu
  end
  
  # 一覧表示機能
  def display
    puts "\n登録されたゲーム一覧"
    puts @separator
    @game_list.each do |game|
      puts "タイトル：#{game[0]}"
      puts "ハード：#{game[1]}"
      puts "メーカー：#{game[2]}"
      print "評価："
      puts sprintf( "%-*s", 5,  "★" * game[3].to_i).gsub(" ", "☆").gsub("★", "★ ").gsub("☆", "☆ ")
      puts @separator
    end
    back_menu
  end

  # 削除機能
  def game_delete
    puts "\n登録されたゲームを削除します。削除したいゲームの番号を選んでください。"
    puts @separator
    n = 0
    @game_list.each do |game|
      n += 1
      puts "#{n} : #{game[0]}"
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

    print "本当に#{@game_list[delete_num.to_i - 1][0]}を削除しますか？削除する場合は y キーを押してください。> "
    key = gets.chomp
    if key == "y"
      puts "#{@game_list[delete_num.to_i - 1][0]}を削除しました。"
      @game_list.delete_at(delete_num.to_i - 1)
      puts "メニューに戻ります。"
    else
      puts "メニューに戻ります。"
    end
    back_menu
  end

  # メインメニュー
  def run
    puts "\n#{@separator}"
    puts "所持ゲーム管理ツール"
    puts @separator
    puts "1.ゲームの登録"
    puts "2.登録したゲームの一覧"
    puts "3.登録したゲームの削除"
    puts "(使いたい機能の番号を入力してください)"
    print ">"
    function = gets.chomp.to_i

    # 不正な数字が入力された場合の処理
    until function == 1 || function == 2 || function == 3
      puts "(1～3の数字を入力してください。)"
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
    end
  end

  def back_menu
    puts @separator
    print "メインメニューに戻る（エンターキー) >"
    gets.chomp
    run
  end
end


game_shelf = GameInfo.new
game_shelf.run
