FactoryBot.define do
  factory :order_receiver do
    post_code { '111-1111' }
    city { Faker::Lorem.sentence }
    house_number { 'aaaaaa' }
    phone_number { 12_345_678_901 }
    prefecture_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
    building_name { 'aaaaaa' }
  end
end
