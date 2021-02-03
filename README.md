＃テーブル設計

## users テーブル

| column             | Type   | Options                   |
| ---------- --------| -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth              | date   | null: false               |


### Association
 - has_many :orders
 - has_many :items


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| introduction       | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order


## orders テーブル

| column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item                   | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |


### Association
 - has_one :receiver
 - belongs_to :user
 - belongs_to :item



 ## receivers テーブル

| column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| phone_number    | string     | null: false                    |
| building_name   | string     |                                |
| prefecture_id   | integer    | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association
 - belongs_to :order

