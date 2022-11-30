class Category < ApplicationRecord
    has_many :products_categories, dependent: :destroy
    has_many :products, through: :products_categories

    validates :name, presence: true
    validates :description, length: { maximum: 2000 }

    paginates_per 10
end
