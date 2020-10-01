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
| birthday            | date    | null: false |


## Association

has_many :items
has_many :buyers

## itemsテーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| text                     | text       | null: false                    |
| category_id              | integer     | null: false                    |
| condition_id             | integer    | null: false                    |
| delivery_fee_defrayer_id | integer    | null: false                    |
| forwarder_area_id        | integer    | null: false                    |
| sending_days_id          | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

## Association

belongs_to :user
has_one    :buyer

## buyerテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

## Association
has_one    :address
belongs_to :user
belongs_to :item

## addressテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| buyer          | references | null: false, foreign_key: true |

## Association
belongs_to :buyer
