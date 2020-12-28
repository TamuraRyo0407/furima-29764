FactoryBot.define do
  factory :order do
    zip_code      {"123-4567"} 
    prefecture_id {2} 
    municipality  {"テスト"} 
    address       {"テスト"} 
    phone_number  {"000"} 
  end
end
