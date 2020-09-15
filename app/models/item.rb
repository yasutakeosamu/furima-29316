class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :fee
  belongs_to_active_hash :from
  belongs_to_active_hash :status

  has_one_attached :image

  belongs_to :user

  validates :image, :name, :text, :price, presence: true
  validates :category_id, :status_id, :fee_id, :from_id, :day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end
