# quiz_practice_app DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|Nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
has_many :quizzes

## quizzesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|answer|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :reviews, through: :quizzes_reviews
- has_many :quizzes_reviews
- has_many :correctnesses

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|tag|string|null: false|
### Association
- has_many :quizzes, through: :quizzes_reviews
- has_many :quizzes-reviews

## quizzes-reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|review|references|null: false, foreign_key: true|
|quiz|references|null: false, foreign_key: true|
### Association
- belongs_to :quiz
- belongs_to :review

## correctnessesテーブル
|Column|Type|Options|
|------|----|-------|
|answer_flg|boolean|null: false, default: false|
|quiz|references|null: false, foreign_key: true|
### Association
- belongs_to :quiz