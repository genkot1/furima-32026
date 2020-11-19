# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| kanji_last_name  | string | null: false |
| kanji_first_name | string | null: false |
| kana_last_name   | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| image          |            |                                |  <!-- Active Storageで実装 -->
| description    | text       | null: false                    |
| category       | set        | null: false                    |
| condition      | set        | null: false                    |
| price          | integer    | null: false                    |
| shipment_place | set        | null: false                    |
| duration       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one    :purchase
- belongs_to :user

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| expiration_date | date       | null: false                    |
| security_code   | integer    | null: false                    |
| postal_code     | integer    | null: false                    |
| prefecture      | set        | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| purchased       | boolean    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item