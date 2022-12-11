class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :singleprice, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :singleprice, numericality: true

  def price_in_dollar
    self[:singleprice] / 100.0
  end
end
