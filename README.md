# README

# hello koyashika I am tokukura
## usersテーブル
| Column                          | Type     | Options                                |
| ------------------------------- | -------- | -------------------------------------- |
| nickname                        | string   | null: false, unique: true, index: true |
| email                           | string   | null: false, unique: true, index: true |
| encrypted_password              | string   | null: false                            |
| family_name                     | string   | null: false                            |
| first_name                      | string   | null: false                            |
| family_name_furigana            | string   | null: false                            |
| first_name_furigana             | string   | null: false                            |
| birth_day                       | date     | null: false                            |
| family_name_to_deliver          | string   | null: false                            |
| first_name_to_deliver           | string   | null: false                            |
| family_name_to_deliver_furigana | string   | null: false                            |
| first_name_to_deliver_furigana  | string   | null: false                            |
| post_code                       | string   | null: false                            |
| prefecture_id                   | integer  | null: false                            | (active_hash) |
| city_name                       | string   | null: false                            |
| city_address                    | string   | null: false                            |
| building                        | string   |                                        |
| phone_number                    | string   |                                        |

### Association
- has_many :purchase_informations
- has_many :items, dependent: :destroy
- has_many :comments
- belongs_to_active_hash :prefecture


## purchases テーブル （中間テーブル）
| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## items テーブル
| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| name                | string     | null: false, index: true       |
| price               | integer    | null: false                    |
| explanation         | text       | null: false                    |
| category            | references | null: false, foreign_key: true |
| brand               | string     |                                |
| size_id             | integer    | null: false                    | (active_hash)
| state_id            | integer    | null: false                    | (active_hash)
| shipping_charge_id  | integer    | null: false                    | (active_hash)
| shipping_date_id    | integer    | null: false                    | (active_hash)
| prefecture_id       | integer    | null: false                    | (active_hash)
| user                | references | null: false, foreign_key: true |

### Association
- has_many :item_images, dependent: :destroy
- has_many :purchase_informations
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :state
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :prefecture


## comments テーブル（中間テーブル）
| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| comment             | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item




## categories テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| ancestry  | string |             |
<!-- ancestryはgem追加必要  -->

### Association
- has_many :items


## item_images テーブル
|Column  | Type       | Options                        |
| ------ | ---------- | -----------------------------  |
|url     | string     | null: false                    |
|item    | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## cards テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_id        | string     | null: false                    |
| customer_id    | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to: user