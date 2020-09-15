FactoryBot.define do
  factory :item do
    name { Faker::Food.fruits }
    text { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    fee_id { Faker::Number.between(from: 2, to: 3) }
    from_id { Faker::Number.between(from: 2, to: 48) }
    day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
