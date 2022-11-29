class Product < ApplicationRecord
  belongs_to :discount, optional: true

  has_many :order_products, dependent: nil
  has_many :orders, through: :order_products

  has_many :products_categories, dependent: nil
  has_many :categories, through: :products_categories
  accepts_nested_attributes_for :products_categories, allow_destroy: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
    attachable.variant :display, resize_to_limit: [600, 600]
  end

  # has_many_attached :pictures do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [200, 200]
  # end

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, :description, presence: true
  validates :isactive, inclusion: { in: [true, false] }
  validates :price, numericality: true

  def price_in_dollar
    format("%.2f", (self[:price].to_i / 100.0))
  end
end
