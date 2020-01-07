## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :posts,  through:  :group_posts
- has_many :group,  through:  :group_posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group
- has_many :group_posts
- has_many  :group,  through:  :group_posts

## groupテーブル
|Column|Type|Options|
|------|----|-------|
|groupname|text|null: false|
### Association
- has_many :post
- has_many :user
- has_many  :group_posts
- has_many  :posts,  through:  :group_posts

## groups_postsテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|posts_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :posts