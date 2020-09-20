class PurchaseCustomer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :state, :city, :address, :building, :phone_number

  attr_accessor :token
  validates :token, :user_id, :item_id, :postal_code, :state, :city, :address, :phone_number, presence:true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  validates :state, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Customer.create(postal_code: postal_code, state: state, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id )
  end
end