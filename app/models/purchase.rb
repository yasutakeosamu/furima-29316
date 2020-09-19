class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :customer

  attr_accessor :token
  validates :token, :user_id, :item_id, presence:true
end
