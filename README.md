# quiz_practice_app DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|Nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
has_many :quizs

## quizsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|answer|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :reviews, through: :quiz_reviews
- has_many :quiz_reviews

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|tag|string|null: false|
### Association
- has_many :quizs, through: :quiz_reviews
- has_many :quiz-reviews

## quiz-reviews-テーブル
|Column|Type|Options|
|------|----|-------|
|review|references|null: false, foreign_key: true|
|quiz|references|null: false, foreign_key: true|
### Association
- belongs_to :quiz
- belongs_to :review