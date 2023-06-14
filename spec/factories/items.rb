FactoryBot.define do
  factory :item do
    association :user

    name { "あああ" }
    description { 'test' }
    category_id { 2 }
    item_status_id { 3 }
    shipping_cost_id { 2 }
    delivery_area_id { 2 }
    shipping_date_id { 3 }
    price { 3689139 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end