class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :item_id, :user_id,
                :order_id

  with_options presence: true do
    validates :user_id, :item_id
    validates :token, :city_name, :block_name
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }

    with_options format: { with: /\A\d{3}-\d{4}\z/ } do
      validates :postal_code, length: { is: 8 }
    end
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name,
                   block_name: block_name, building_name: building_name, phone_number: phone_number)
  end
end
