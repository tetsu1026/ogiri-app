# 正解のない問題たち

# アプリケーション概要
このアプリケーションは、大喜利を通じてユーザーの「発想力」を鍛えること  
を目的としたアプリケーション。  
「お題の投稿」「お題に回答」「お題や回答の判定」この3つの機能を使い、「発想力」や  
「表現力」を鍛えたり、自分の好きな方法で大喜利に参加できる。

## 「お題の投稿」
お題は、「文章問題」か「写真にタイトルをつける」が選択する。  
これは、回答するだけでなく0から1を作ることで「発想力」を鍛える。  
文章問題を考えるのが苦手な方のために、写真を投稿するだけでいいカテゴリーも作成。  

## 「投稿されているお題から好きなものを選び回答できる」
お題に回答することで、「発想力」や「表現力」鍛える。  
また、他のユーザーの回答も見ることができるため色々な考え方に触れて「発想の視野」を  
広げるのも目的の1つ。  

## 「お題、回答の判定機能」
お題や回答を他者から評価されることにより、自分の発想がどのくらい他者の心を  
動かしたか、数値で把握する。  
この結果は、ランキング表に表示されるため、競争ができてモチベーションを高めることもできる。  
また、お題や回答で参加するのが苦手な方も審査員としてアプリに参加できる。  

# デプロイ後のURL
 (https://ogiri-app-1026.herokuapp.com/)

# テスト用アカウント
ユーザー名:test  
email:test@test212  
password:aaa111

# DEMO
## ログイン前のトップページ
[![Image from Gyazo](https://i.gyazo.com/9a4f0d0a60b94b939e5c679d51360f29.jpg)](https://gyazo.com/9a4f0d0a60b94b939e5c679d51360f29)

## ログイン済みトップページ
[![Image from Gyazo](https://i.gyazo.com/7c920b1b697a7507b47bf24b73c29b59.jpg)](https://gyazo.com/7c920b1b697a7507b47bf24b73c29b59)

## 新規登録ページ
[![Image from Gyazo](https://i.gyazo.com/9e0f1daf37eccb530416e40f62095173.jpg)](https://gyazo.com/9e0f1daf37eccb530416e40f62095173)

## ログインページ
[![Image from Gyazo](https://i.gyazo.com/f411e22e32cc25c3a581fbd155e8e6b6.jpg)](https://gyazo.com/f411e22e32cc25c3a581fbd155e8e6b6)

## 出題ページ
[![Image from Gyazo](https://i.gyazo.com/9c8644e1f9ae811f455d16f1cf1ae516.jpg)](https://gyazo.com/9c8644e1f9ae811f455d16f1cf1ae516)

## トップページ/投稿されたお題一覧
[![Image from Gyazo](https://i.gyazo.com/b5598a34e7d41357837f5ad80030dd86.jpg)](https://gyazo.com/b5598a34e7d41357837f5ad80030dd86)

## トップページ/お題のランキング表
[![Image from Gyazo](https://i.gyazo.com/7a12db53565b2aec1f9615bd01410191.jpg)](https://gyazo.com/7a12db53565b2aec1f9615bd01410191)

## お題回答ページ上部/お題タイトル、投稿者回答、回答ランキング表
[![Image from Gyazo](https://i.gyazo.com/1b535e54545907c1faf77e16ce52ac4b.jpg)](https://gyazo.com/1b535e54545907c1faf77e16ce52ac4b)

## お題回答ページ下部/回答一覧
[![Image from Gyazo](https://i.gyazo.com/65ccdc1a56d179db9b217d666c34afbe.jpg)](https://gyazo.com/65ccdc1a56d179db9b217d666c34afbe)

## マイページ上部/ユーザー情報
[![Image from Gyazo](https://i.gyazo.com/a01309e632c403c09b4cd7854f0e605b.jpg)](https://gyazo.com/a01309e632c403c09b4cd7854f0e605b)

## マイページ下部/好きな投稿一覧、ユーザーの投稿一覧
[![Image from Gyazo](https://i.gyazo.com/7aee8e11f77b144485c14a6b72a9a0c1.jpg)](https://gyazo.com/7aee8e11f77b144485c14a6b72a9a0c1)

## ユーザー情報編集・退会ページ
[![Image from Gyazo](https://i.gyazo.com/6414265c99554633fd5c9ce3b3050a5e.jpg)](https://gyazo.com/6414265c99554633fd5c9ce3b3050a5e)

# 利用方法
### ログイン
1.アクセスするとトップページに遷移  
2.ヘッダー部分の「ログイン」をクリック  
3.ログインページに遷移した上で、上記テスト用アカウントでログイン  

### お題の投稿
1.ヘッダー部分の「出題する」をクリックする  
2.新規お題作成ページに遷移した上で、下記を入力する  
  ・「写真にタイトルをつける」の場合  
    ①ジャンルで「写真にタイトルを付ける」を選択  
    ②写真を添付する  
    ③出題者の回答を50字以内で入力する  
    ④出題するをクリック  
  ・「文章問題の場合」  
    ①ジャンルで「文章問題」を選択  
    ②お題のフォームに50字以内でお題を入力する  
    ③出題者の回答を50字以内で入力する  
    ④出題するをクリック  

### お題の回答
1.トップページの「お題一覧」の下記に表示されている好きなお題を選択し「お題に挑戦する」をクリック  
2.お題の詳細ページに遷移  
3.ページ下記にある、「回答フォーム」に回答を入力し、「送信」をクリックする  
4.送信された回答は上記の「回答一覧」に新規回答が一番上になりように表示される  

### お題と回答の判定
  ・「お題の判定」  
    ①トップページの中からいいと思ったお題を選択  
    ②お題の下部に表示されている、笑顔の絵文字をクリックする  
    ③クリックすると右の数字のカウントが1つ上がる  
    ④もう一度クリックすると、取り消すことができる  
    ⑤お題は上記の「お題ポイントランキング」に判定数の多い順にランキング表示される  
    ⑥クリックしたお題は「好きなお題」としてマイページに一覧表示される  
  ・「回答の判定」  
    ①トップページの「お題一覧」の下記に表示されている好きなお題を選択し「お題に挑戦する」をクリック  
    ②お題の詳細ページに遷移  
    ③回答一覧に表示されている、面白いと思った回答を選択し右に表示されている笑顔の絵文字をクリック  
    ④クリックすると右の数字のカウントが1つ上がる  
    ⑤もう一度クリックすると、取り消すことができる  
    ⑥回答は、上記の「ポイントランキング」判定数の多い順にランキング表示される  

# 課題解決
ゲームのような感覚で、脳のトレーニングを行いそれが数値化してわかり成長を感じられる。  
大喜利を体験してみたい。  

# 洗い出した要件
・隙間時間を利用して、脳のトレーニングを行いたい  
・「発想力」「表現力」鍛えたい  
・他者の思考に触れてみたい  
・自分の思考が面白いか評価を受けたい  
・日常生活ではあまりできない大喜利に参加したい  
・「お題」「回答」「判定」参加方法が選べる  

# 機能一覧
| 機能               | 概要                                                            |
| ----------------- | --------------------------------------------------------------- |
| ユーザー管理機能     | 新規登録・ログイン・ログアウトが可能                                  |
| お題投稿機能        | 文章でのとうこ投稿か写真での投稿ができる                               |
| お題詳細機能        | お題詳細ページより、回答ができる                                      |
| お題編集削除機能     | 投稿者のみお題の編集・削除ができる                                    |
| ユーザー詳細表示機能  | 各ユーザーのプロフィール、投稿一覧、「面白いと判定した投稿一覧」が見れる    |
| ユーザー編集・削除機能 | 本人のみプロフィール情報の編集や退会ができる                           |
| 回答機能            | お題詳細ページから回答が行える、回答するとプロフィール写真と名前が表示される |
| 回答判定機能         | 回答の隣にある、絵文字をクリックするとカウントが1つ上がる、削除も可能      |
| お題判定機能         | 投稿されているお題の絵文字をクリックすると、カウントが1つ上がる、削除も可能 |
| 回答ランキング機能    | 回答されたものが、判定に応じてランキング表示される、同じ表数は同率順位で表示 |
| お題ランキング機能    | 投稿されたお題は、判定に応じてランキング表示される、同じ表数は同率順位で表示 |


# 開発環境
・VScode  
・Ruby 2.6.5  
・Rails 6.0.3.4  
・Mysql2 0.4.4  
・gem 3.0.3  
・Heroku 7.47.11  

# 追加予定機能
・コメントの非同期通信  
・判定機能の非同期通信  
・フォロー機能  

# DB設計

# ユーザー管理機能
・usersテーブル

| Column               | Type       | Options                  |
| -------------------- | ---------- | ------------------------ |
| email                | string     | null: false,unique: true |
| encrypted_password   | string     | null: false              |
| nickname             | string     | null: false              |
| profile              | string     | null: false              |


### Association
- has_many :posts
- has_many :comments
- has_many :likes
- has_many :post_likes

# お題投稿機能
・postsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| genre_id  | integer    | null: false                    |
| sentence  | string     | null: false,                   |
| user      | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- has_many :likes
- has_many :post_likes

# お題回答機能
・commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| message   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post
- has_many :likes
- has_many :post_likes

# 回答判定機能
・likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |
| comment   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post
- belongs_to :comment

# お題判定機能
・post_likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

