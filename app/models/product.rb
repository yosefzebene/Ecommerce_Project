class Product < ApplicationRecord
  has_many :order_products
  has_many :products_categories

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [500, 500]
  end

  validates :name, :price, :description, :image, presence: true
  validates :price, numericality: true
end
