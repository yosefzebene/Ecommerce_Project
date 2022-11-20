class Product < ApplicationRecord
  has_many :order_products
  has_many :products_categories
end
