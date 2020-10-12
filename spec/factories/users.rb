FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    familyname            {"テスト"}
    firstname             {"テスト"}
    familyname_katakana   {"テスト"}
    firstname_katakana    {"テスト"}
    birthday              {"2000-01-01"}
  end
end