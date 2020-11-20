# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| kanji_last_name    | string | null: false |
| kanji_first_name   | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| image             |            |                                |  <!-- Active Storageで実装 -->
| description       | text       | null: false                    |
| shipping_fee_id   | integer    | null: false                    |  <!-- 配送料負担 -->
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| price             | integer    | null: false                    |
| shipment_place_id | integer    | null: false                    |  <!-- 発送元の地域 -->
| duration_id       | integer    | null: false                    |  <!-- 発送までの日数 -->
| user              | references | null: false, foreign_key: true |

### Association

- has_one    :purchase
- belongs_to :user

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |  <!-- purchasesテーブルの紐付け -->

### Association

- belongs_to :purchase
