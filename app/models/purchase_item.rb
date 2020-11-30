class PurchaseItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true }, length: ( in: 10..11 )
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "Select"}

  def save
    PurchaseItem.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, user_id: current_user.id)
  end
end
