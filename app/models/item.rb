class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :delivery_area
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date
 
  has_one_attached :image
 
  with_options presence: true do
   validates :image
   validates :name
   validates :description
   validates :category_id
   validates :item_status_id
   validates :shipping_cost_id
   validates :delivery_area_id
   validates :shipping_date_id

   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
   validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  end
 
  with_options numericality: { other_than: 0 } do
   validates :category_id
   validates :delivery_area_id
   validates :item_status_id
   validates :shipping_cost_id
   validates :shipping_date_id
  end
  validates :price, numericality: true
end
