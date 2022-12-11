class Region < ApplicationRecord
  belongs_to :country
  has_many :locations, dependent: nil
  has_one :tax_rate, dependent: :destroy

  validates :name, :code, presence: true
end
