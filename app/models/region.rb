class Region < ApplicationRecord
  belongs_to :country
  has_many :locations, dependent: nil
  has_one :tax_rate, dependent: nil

  validates :name, :code, presence: true
end
