class Product < ApplicationRecord
  has_many :order_products
  has_many :products_categories

  validates :name, :price, :description, presence: true
  validates :price, numericality: true
end
