FactoryBot.define do
  factory :order_form do
    
    postal_code {'123-4567'}
    prefecture_id { '4' }
    city_name { '横浜市' }
    block_name { '1-1-1' }
    building_name { '建物ビル' }
    phone_number { '07011112222' }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
