class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :duration

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
    with_options numericality: { other_than: 0, message: "Select" } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :duration_id
    end
  end
  validates :price, numericality: { with: VALID_PRICE_REGEX, message: "Half-width number" }
end
