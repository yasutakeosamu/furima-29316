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
| birthday | date | null:false |

### Association
- has_many :items
- has_many :purchases
- has_one :card, dependent: :destroy

## cardsテーブル
| Column | Type | Option |
| -------|------|--------|
| card_token | string | null:false |
| customer_token | string | null:false |
| user | references | null:false, foreign_key:true |

### Association
- belongs_to :user

## items テーブル
| Column | Type | Option |
|--------|------|--------|
| name | string | null:false |
| text | text | null:false |
| category_id | integer | null:false |
| status_id | integer | null:false |
| fee_id | integer | null:false |
| from_id | integer | null:false |
| day_id | integer | null:false |
| price | integer | null:false |
| user | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- has_one :purchase

## purchaseテーブル
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