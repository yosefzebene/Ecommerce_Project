class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products, allow_destroy: true

  validates :subtotal, presence: true
  validates :PST, :GST, :HST, :subtotal, numericality: true

  def total_tax
    format("%.2f", ((self[:PST] + self[:GST] + self[:HST]).to_i / 100.0))
  end

  def subtotal_in_dollar
    format("%.2f", (self[:subtotal].to_i / 100.0))
  end

  def calculated_total
    format("%.2f", ((self[:subtotal] + self[:PST] + self[:GST] + self[:HST]).to_i / 100.0))
  end
end
