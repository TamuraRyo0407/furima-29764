# README

# テーブル設計

## usersテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| familyname          | string  | null: false |
| firstname           | string  | null: false |
| familyname_katakana | string  | null: false |
| firstname_katakana  | string  | null: false |
| birthday_year       | integer | null: false |
| birthday_month      | integer | null: false |
| birthday_day        | integer | null: false |

## Association

has_many :items
has_many :buyer

## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_image            | text       | null: false                    |
| item_name             | string     | null: false                    |
| item_text             | text       | null: false                    |
| item_category         | string     | null: false                    |
| item_condition        | string     | null: false                    |
| delivery_fee_defrayer | string     | null: false                    |
| forwarder_area        | string     | null: false                    |
| sending_days          | string     | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

## Association

belongs_to :users
has_one    :buyer

## buyerテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| card_term_year  | integer    | null: false                    |
| card_term_month | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

## Association
has_one    :address
belongs_to :users
belongs_to :items

## addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| buyer         | references | null: false, foreign_key: true |

## Association
belongs_to :buyer
