# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|lastname_kanji|string|null: false|
|firstname_kanji|string|null: false|
|lastname_katakana|string|null: false|
|firstname_katakana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|tel|string|null: false|
### Association
- has_many :buyers_users, dependemt: :destoy
- has_many :user_credit_cards, dependemt: :destoy
- has_many :sellers_users, dependemt: :destoy
- has_many :items, dependemt: :destoy


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|FK: true|
|user_id|references|null: false, FK: true|
|category_id|references|null: false, FK: true|
|name|string|null: false|
|text|text|null: false|
|cost|string|null: false|
|situation|string|null: false|
|size|string||
|deliver_area|string|null: false|
|shipping_term|string|null: false|
|price|integer|null: false|
|seller_id|string||
|buyer_id|string||
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :images, dependent: :destoy


## photosテーブル
|Column|Type|Options|
|------|----|-------|
|name|references|null: false|
|url|string|null: false|
### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items, dependent: :destoy


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items, dependent: :destoy


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|card_number|integer|null: false|
|expire_month|integer|null: false|
|expire_day|integer|null: false|
|security_code|null: false|
### Association
- belongs_to :user 