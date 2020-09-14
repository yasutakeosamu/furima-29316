class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :fee
  belongs_to_active_hash :from
  belongs_to_active_hash :status

  has_one_attached :image

  belongs_to :user

  validates :name, :text, :category_id, :status_id, :fee_id, :from_id, :day_id, :price, :user_id, presence: true
end
