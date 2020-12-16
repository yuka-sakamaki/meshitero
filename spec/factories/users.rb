FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    restaurant_name       {"レストラン名"}
    postal_code           {"123-4567"}
    prefecture_id         { 2 }
    city                  {"横浜市"}
    address               {"緑区9−3"}
    phone_number          {"09012345678"}
  end
end