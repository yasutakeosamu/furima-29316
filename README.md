# テーブル設計

## usersテーブル
| Column | Type | Option |
|--------|------|--------|
| nickname | string | null:false |
| email | string | null:false |
| password | string | null:false |

### Association
- has_many :items

## items テーブル
| Column | Type | Option |
|--------|------|--------|
| name | string | null:false |
| text | text | null:false |
| category | string | null:false |
| status | string | null:false |
| fee | string | null:false |
| from | string | null:false |
| days | string | null:false |
| price | string | null:false |
| user_id | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- has_one :customer

## customersテーブル
| Column | Type | Option |
|--------|------|--------|
| postal_cord | integer | null:false |
| state | string | null:false |
| city | string | null:false |
| address | string | null:false |
| building | string |   |
| phone_number | integer | null:false |
| item_id | references | null:false, foreign_key:true |

### Association
- belongs_to :item