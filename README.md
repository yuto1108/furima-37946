# テーブル設計

## itemsテーブル

| Column              | Type     | Options      |
|---------------------|----------|--------------|
| name                | string   | null: false  |
| content             | text     | null: false  |
| category_id         | integer  | null: false  |
| situation_id        | integer  | null: false  |
| delivery_charge_id  | integer  | null: false  |
| prefectures_id      | integer  | null: false  |
| delivery_date_id    | integer  | null: false  |
| price               | integer  | null: false  |

### Association

- belongs_to :user
- has_one :order
- has_one :purchases


## usersテーブル

| Column              | Type     | Options                    |
|---------------------|----------|----------------------------|
| nickname            | string   | null: false                |
| email               | string   | null: false,  unique: true |
| encrypted_password  | string   | null: false                |
| last_name           | string   | null: false                |
| first_name          | string   | null: false                |
| last_name_reading   | string   | null: false                |
| first_name_reading  | string   | null: false                |
| birthday            | date     | null: false                |


### Association

- has_many :items
- has_many :orders
- has_many :purchases


## ordersテーブル

| Column            | Type        | Options                         |
|-------------------|-------------|---------------------------------|
| post_number       | string      | null: false                     |
| prefectures_id    | integer     | null: false                     |
| city              | string      | null: false                     |
| address           | string      | null: false                     |
| building_name     | string      |                                 |
| telephone_number  | string      | null: false                     |
| purchases_id      | references  | null: false, foreign_key: true  |


### Association

- belongs_to :item
- belongs_to :user
- belongs_to :purchase


## purchasesテーブル

| Column    | Type        | Options                         |
|-----------|-------------|---------------------------------|
| user_id   | references  | null: false, foreign_key: true  |
| items_id  | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order