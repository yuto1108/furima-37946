# テーブル設計

## itemsテーブル

| Column   | Type     | Options      |
|----------|----------|--------------|
| name     | string   | null: false  |
| content  | string   | null: false  |
| price    | integer  | null: false  |

### Association

- belongs_to :user
- has_one :order


## usersテーブル

| Column       | Type     | Options                    |
|--------------|----------|----------------------------|
| nickname     | string   | null: false                |
| email        | string   | null: false,  unique: true |
| password     | string   | null: false                |
| last_name    | string   | null: false                |
| first_name   | string   | null: false                |

### Association

- has_many :items
- has_many :order


## ordersテーブル

| Column            | Type     | Options      |
|-------------------|----------|--------------|
| post_number       | integer  | null: false  |
| city              | string   | null: false  |
| address           | string   | null: false  |
| building_name     | string   |              |
| telephone_number  | integer  | null: false  |

### Association

- has_many :items
- has_many :