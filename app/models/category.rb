class Category < ApplicationRecord
    has_many :products_categories

    validates :name, :description, presence: true
end
