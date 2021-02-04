FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    first_name {Gimei.name.kanji}
    last_name {Gimei.name.kanji}
    first_name_kana {Gimei.name.katakana}
    last_name_kana {Gimei.name.katakana}
    birth {Faker::Date}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end