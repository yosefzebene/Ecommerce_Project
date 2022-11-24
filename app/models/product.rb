class Product < ApplicationRecord
  belongs_to :discount, optional: true
  
  has_many :order_products

  has_many :products_categories
  has_many :categories, through: :products_categories
  accepts_nested_attributes_for :products_categories, allow_destroy: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
    attachable.variant :display, resize_to_limit: [600, 600]
  end

  validates :name, uniqueness: true, presence: true, length: { maximum: 100 }
  validates :price, :description, :image, presence: true
  validates :isactive, inclusion: { in: [ true, false ], message: "Please, select one!" }
  validates :name, uniqueness: true
  validates :price, numericality: true
end
