##usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false                    |
| encrypted_password  | string     | null: false                    |
| family_name         | string     | null: false                    |
| first_name          | string     | null: false                    |
| family_name_kana    | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| birth_day           | date       | null: false                    |


###Association
- has_many :items
- has_many :record





##itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_fee_id     | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


###Association
- belongs_to :user
- has_one    :record
- has_one    :destination





##destinationテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| address             | string     | null: false                    |
| building            | string     |                                |
| phon_number         | string     | null: false                    |


###Association
- has_one    :record
- belongs_to :item




##recordテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
| destination         | references | null: false, foreign_key: true |

###Association
- belongs_to :destination
- belongs_to :item
- belongs_to :user
