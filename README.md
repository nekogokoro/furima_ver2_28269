# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| last_name   | string | null: false |
| first_name  | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| password    | string | null: false |
| email       | string | null: false |
| birthday    | date   | null: false |


### Association
- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| image        | text       | null: false |
| name         | string     | null: false, length: { maximum: 40} |
| description  | text       | null: false,length: { maximum: 1000} |
| price        | integer    | null: false,length: { minimum: 300, maximum: 9999999 } |
| user         | references | null: false, foreign_key: true |

### Association
- has_one :order
- has_one :address
- belongs_to :user

### Active Hash
| status       | integer     | null: false |
| delivery_fee | integer     | null: false |
| area         | integer     | null: false |
| delivery_day | integer     | null: false |
| category     | integer     | null: false |

## orders テーブル

| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## addresses テーブル
| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| postal     | string     | null: false |
| prefecture | integer    | null: false |
| city       | string     | null: false |
| house_num  | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :item