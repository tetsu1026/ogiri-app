# 正解のない問題たち

# アプリケーション概要
このアプリケーションは、大喜利を通じてユーザーの「発想力」を鍛えるアプリケーションです。
「お題の投稿」「お題に回答」「お題や回答の判定」この3つの機能を使い、「発想力」を鍛えたり
好きな方法で大喜利を楽しめたりします。

## 「お題の投稿」
お題は、「文章問題」か「写真にタイトルをつける」が選びます。  
これは、0から1を作る発想力を鍛えます。  
何もないところから、頭の中であらゆるシチュエーションを想定しお題を作成します。  
文章問題を考えるのが苦手な方のために、写真を投稿するだけでいいカテゴリーも作りました。  

## 「投稿されているお題から好きなものを選び回答できる」
お題に回答することで、「発想力」や「表現力」鍛えます。  
また、他のユーザーの回答も見ることができるので色々な考え方に触れて「発想の視野」が広がります。  

## 「お題、回答の判定機能」
お題や回答を他者から評価されることにより、自分の発想がどのくらい他者の心を  
動かしたか、数値でわかります。  
この結果は、ランキング表に表示されるので、競争ができてモチベーションをあげることもできます。  
また、お題や回答で参加するのが苦手な方も審査員としてアプリに参加できます。  

# デプロイ後のURL
 (https://ogiri-app-1026.herokuapp.com/)

# テスト用アカウント
ユーザー1 nickname:test1  
email:test1@test  
password:aaa111

ユーザー2 nickname:test2  
email:test2@test  
password:aaa222  

ユーザー3 nickname:test3  
email:test3@test  
password:aaa333  

# DEMO
## ログイン前のトップページ
[![Image from Gyazo](https://i.gyazo.com/2681ea750b0d24860f10d29f840c2433.gif)](https://gyazo.com/2681ea750b0d24860f10d29f840c2433)

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

- belongs_to :user
- belongs_to :post
- belongs_to :comment

# お題判定機能
・post_likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |


- belongs_to :user
- belongs_to :post

