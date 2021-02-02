# README

# README
## usersテーブル

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

## postsテーブル

| Column    | Type       | Options                        |
| ---------------------- | ------------------------------ |
| title     | string     | null: false                    |
| genre_id  | integer    | null: false                    |
| sentence  | string     | null: false,                   |
| user      | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- has_many :likes
- has_many :post_likes

## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| message   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :post
- has_many :likes
- has_many :post_likes

## likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |
| comment   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :post
- belongs_to :comment

## post_likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |


- belongs_to :user
- belongs_to :post
- 

