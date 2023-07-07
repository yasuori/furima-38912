FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id { '4' }
    city_name { '横浜市' }
    block_name { '1-1-1' }
    building_name { '建物ビル' }
    phone_number { '07011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
