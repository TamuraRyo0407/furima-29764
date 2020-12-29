FactoryBot.define do
  factory :order do
    zip_code      {"123-4567"} 
    prefecture_id {2} 
    municipality  {"テスト"} 
    address       {"テスト"} 
    building_name {"テスト"}
    phone_number  {"000"} 
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       {"1"}
    item_id       {"1"}
  end
end
