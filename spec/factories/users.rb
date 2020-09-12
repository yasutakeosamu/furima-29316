FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password }
    password_confirmation { password }
    familyname { Faker::Name.last_name }
    firstname { Faker::Name.first_name }
    familyname_reader { 'カタカナ' }
    firstname_reader { 'カタカナ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2020-08-31') }
  end
end
