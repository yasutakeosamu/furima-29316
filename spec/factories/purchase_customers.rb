FactoryBot.define do
  factory :purchase_customer do
    token { Faker::Lorem.characters }
    postal_code { Faker::Address.postcode }
    state { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.number(digits: 11) }
    user_id { Faker::Number.between(from: 1, to: 5) }
    item_id { Faker::Number.between(from: 1, to: 50) }
  end
end
