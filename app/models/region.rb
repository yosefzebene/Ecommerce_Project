class Region < ApplicationRecord
  belongs_to :country
  has_many :locations
  has_one :tax_rate

  validates :name, :code, :country, presence: true
end
