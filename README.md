##usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false, unique: true      |
| user_password       | string     | null: false,                   |
| name                | string     | null: false,                   |
| family_name         | text       | null: false,                   |
| first_name          | text       | null: false,                   |
| family_name_kana    | text       | null: false,                   |
| first_name_kana     | text       | null: false,                   |
| birth_day           | date       | null: false,                   |



###Association
- has_many :items
- has_one  :buyers


##itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_image          | text       | null: false,                   |
| item_name           | string     | null: false,                   |
| description         | text       | null: false,                   |
| category_id         | integer    | null: false,                   |
| status_id           | integer    | null: false,                   |
| shipping_fee_id     | integer    | null: false,                   |
| prefecture_id       | integer    | null: false,                   |
| shipping_days_id    | integer    | null: false,                   |
| price               | integer    | null: false,                   |
| user_id             | reference  | null: false, foreign_key: true |


###Association
- belongs_to :users


##buyersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false,                   |
| prefecture_id       | integer    | null: false,                   |
| address             | string     | null: false,                   |
| building            | string     |                                |
| phon_number         | string     | null: false,                   |
| user_id             | reference  | null: false, foreign_key: true |

###Association
- belongs_to :users