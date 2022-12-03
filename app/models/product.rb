class Product < ApplicationRecord
  belongs_to :discount, optional: true

  has_many :order_products, dependent: nil
  has_many :orders, through: :order_products

  has_many :products_categories, dependent: nil
  has_many :categories, through: :products_categories
  accepts_nested_attributes_for :products_categories, allow_destroy: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [128, 128]
    attachable.variant :display, resize_to_fill: [600, 600]
  end

  paginates_per 8

  # has_many_attached :pictures do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [200, 200]
  # end

  validates :name, presence: true, length: { maximum: 200 }
  validates :price, :description, presence: true
  validates :isactive, inclusion: { in: [true, false] }
  validates :price, numericality: true

  scope :activeproducts, -> { where(isactive: true) }
  scope :onsale, -> { activeproducts.where.not(discount_id: nil) }
  scope :newproducts, -> { activeproducts.where("DATE(created_at) > ?", Time.zone.today - 3) }

  def price_in_dollar
    format("%.2f", (self[:price].to_i / 100.0))
  end
end
