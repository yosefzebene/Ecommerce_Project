class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products

  validates :status, :subtotal, presence: true
  validates :PST, :GST, :HST, :subtotal, numericality: true
end
