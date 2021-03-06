## 【所持ゲーム管理ツール(CUI版)ver1.3.0】

CUI上で所持しているゲームを管理するプログラムです。
Ruby初心者が勉強のために製作している自作アプリです。
まだ到底アプリとして使えるレベルではないですが、すこしづつアップデートしていくことが学習になるとの考えで製作しています。

#### はじめに

Rubyでrun.rbを実行することで利用できます。

```
$ ruby run.rb
```

#### 【主要機能】

〇登録  
所持しているゲームの情報、
- タイトル
- ハード
- メーカー
- 購入日
- 評価（５点満点）
- 備考（20字以内）
を入力し、登録する。  

〇閲覧  
登録しているゲームを一覧で表示する。
- 表示例

```
-------------------------
No.1
タイトル：ドラゴンクエスト
ハード：ファミリーコンピュータ
メーカー：エニックス
購入日 : 2019-05-06
評価：★　★　★　★　☆
備考：おもしろかった。
-------------------------
タイトル：ファイナルファンタジー
　　　　　：
```

- 評価は数字で入力し、それをもとに☆マークで表示。  

〇削除  
登録しているゲームを削除する。  
削除は項目毎でなくゲーム単位で削除。

#### 【更新内容】

2019/06/02 : Ver 1.3.0　データ保存の方法をCSVからデータベース(SQlite)へ変更しました。

#### 【次のアップデート内容】
- Webアプリとしてリニューアルさせたいと思っています。
