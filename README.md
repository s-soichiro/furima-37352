## usersテーブル

| Column              | Type       | Options       |
| ------------------- | ---------- | ------------- |
| email               | string     | null: false   |
| encrypted_password  | string     | null: false   |
| nickname            | string     | null: false   |
| first_name          | string     | null: false   |
| last_name           | string     | null: false   |
| first_name_kana     | string     | null: false   |
| last_name_lana      | string     | null: false   |
| birth_date          | string     | null: false   |

### Association
- has_many :items
- has_many :orders



## itemsテーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| name                | string     | null: false                     |
| content             | string     | null: false                     |
| category            | string     | null: false                     |
| status              | string     | null: false                     |
| postage             | string     | null: false                     |
| delivery_area       | string     | null: false                     |
| delivery_date       | string     | null: false                     |
| price               | string     | null: false                     |
| user                | references | null: false, foreign_key: true  |


### Association
- belongs_to :users
- has_one :orders



## ordersテーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false, foreign_key: true  |
| item                | references | null: false, foreign_key: true  |

### Association
- belongs_to :users
- belongs_to :items
- has_one :deliverys



## deliverysテーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| post_code           | string     | null: false                     |
| prefectures         | string     | null: false                     |
| municipalities      | string     | null: false                     |
| adress              | string     | null: false                     |
| building_name       | string     | null: false                     |
| tel_num             | string     | null: false                     |
| order               | references | null: false, foreign_key: true  |

### Association
- belongs_to :orders