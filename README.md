# テーブル設計

## usersテーブル
| Column | Type | Option |
|--------|------|--------|
| nickname | string | null:false |
| email | string | null:false |
| password | string | null:false |
| familyname | string | null:false |
| firstname | string | null:false |
| familyname_reader | string | null:false |
| firstname_reader | string | null:false |
| birthyear | integer | null:false |
| birthmonth | integer | null:false |
| birthday | integer | nul:false |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column | Type | Option |
|--------|------|--------|
| name | string | null:false |
| text | text | null:false |
| category | integer | null:false |
| status | integer | null:false |
| fee | integer | null:false |
| from | integer | null:false |
| days | integer | null:false |
| price | integer | null:false |
| user | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- has_one :purchase

## purcaseテーブル
| Column | Type | Option |
|--------|------|--------|
| user | references | null:false, foreign_key:true |
| item | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :customer


## customersテーブル
| Column | Type | Option |
|--------|------|--------|
| postal_cord | string | null:false |
| state | integer | null:false |
| city | string | null:false |
| address | string | null:false |
| building | string |   |
| phone_number | string | null:false |
| purchase | references | null:false, foreign_key:true |

### Association
- belongs_to :purchase