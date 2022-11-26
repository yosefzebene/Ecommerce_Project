class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :singleprice, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :singleprice, numericality: true

  before_save :set_singleprice
  def singleprice
    if persisted?
      self[:singleprice]
    else
      product.price
    end
  end

  private

  def set_singleprice
    self[:singleprice] = singleprice
  end
end
