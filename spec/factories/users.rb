FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    first_name { '遠藤' }
    last_name { '松本' }
    first_name_kana { 'エンドウ' }
    last_name_kana { 'マツモト' }
    birth { '2000-01-01' }
    email { Faker::Internet.free_email }
    password { 'test123' }
    password_confirmation { password }
  end
end
