class Category < ApplicationRecord
    has_many :products_categories, dependent: :destroy
    has_many :products, through: :products_categories

    validates :name, :description, presence: true

    paginates_per 10
end
