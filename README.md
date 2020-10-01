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
| birthday            | date　　 | null: false |


## Association

has_many :items
has_many :buyer

## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| image                 | text       | null: false                    |
| name                  | string     | null: false                    |
| text                  | text       | null: false                    |
| category              | string     | null: false                    |
| condition             | integer     | null: false                   |
| delivery_fee_defrayer | integer     | null: false                   |
| forwarder_area        | integer     | null: false                   |
| sending_days          | integer     | null: false                   |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

## Association

belong_to :users
has_one    :buyer

## buyerテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

## Association
has_one    :address
belong_to :users
belong_to :items

## addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

## Association
belongs_to :buyer
