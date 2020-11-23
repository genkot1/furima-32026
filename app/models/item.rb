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
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: VALID_PRICE_REGEX}
    with_options numericality: { other_than: 0 } do
      validates :shipping_fee_id
      validates :category_id
      validates :condition_id
      validates :prefecture_id
      validates :duration_id
    end
  end
end
