class Region < ApplicationRecord
  belongs_to :country
  has_many :cities

  validates :name, :code, :country, presence: true
end
