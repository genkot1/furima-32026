class PurchaseItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :city
    validates :house_number
    validates :phone_number, length: {minimum: 10, maximum: 11, message: "Input correctly" }
  end
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Input only number" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
