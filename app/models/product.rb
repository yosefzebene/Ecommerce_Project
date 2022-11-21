class Product < ApplicationRecord
  has_many :order_products

  has_many :products_categories
  has_many :categories, through: :products_categories
  accepts_nested_attributes_for :products_categories, allow_destroy: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end

  validates :name, :price, :description, :image, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
end
