＃テーブル設計

## users テーブル

| column          | Type   | Options     |
| ---------- -----| -------| ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |

### Association
 - has_many :items
 - has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| name            | string     | null: false                    |
| price           | string     | null: false                    |
| postage_payer   | string     | null: false                    |
| preparation_day | string     | null: false                    |
| condition       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| category        | string     | null: false                    |
| introduction    | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| image           |            |                                |

### Association
 - belongs_to :user
 - has_one_attached :order


## orders テーブル

| column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| order_first_name       | string     | null: false                    |
| order_last_name        | string     | null: false                    |
| order_first_name_kana  | string     | null: false                    |
| order_last_name_kana   | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association
 - has_one_attached :item
 - belongs_to :user


 ## receivers テーブル

| column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
 - has_one_attached :order

