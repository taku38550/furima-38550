# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_day             | date   | null: false               |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| image            | string  | null: false                    |
| name             | string  | null: false                    |
| description      | text    | null: false                    |
| category         | string  | null: false                    |
| status           | string  | null: false                    |
| shipping_cost    | string  | null: false                    |
| shipping_address | string  | null: false                    |
| shipping_day     | string  | null: false                    |
| price            | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| user_id    | integer | null: false, foreign_key: true |
| product_id | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer

## buyers テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | string  | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | string  | null: false |


### Association

- has_one :purchase_records
