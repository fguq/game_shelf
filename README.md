## 【所持ゲーム管理ツール(CUI版)ver1.0.0】

CUI上で所持しているゲームを管理するプログラムです。
Ruby初心者が勉強のために製作している自作アプリです。
まだ到底アプリとして使えるレベルではないですが、すこしづつアップデートしていくことが学習になるとの考えで製作しています。

#### 【主要機能】

〇登録  
所持しているゲームの情報、
- タイトル
- ハード
- メーカー
- 評価（５点満点）
を入力し、登録する。  

〇閲覧  
登録しているゲームを一覧で表示する。
- 表示例
```
-------------------------
タイトル：ドラゴンクエスト
ハード：ファミリーコンピュータ
メーカー：エニックス
評価：★　★　★　★　☆
-------------------------
タイトル：ファイナルファンタジー
　　　　　：
```

- 評価は数字で入力し、それをもとに☆マークで表示。  

〇削除  
登録しているゲームを削除する。  
削除は項目毎でなく４つの項目全てを削除。

#### 【注意】
- 登録したデータの保存は現時点では出来ません。（いずれ保存できるようにしたいと思っています。）

####　【次のアップデート内容】
- 終了機能の追加
- 登録項目に「購入日」「備考(140字)」を追加。
