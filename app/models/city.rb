class City < ApplicationRecord
  belongs_to :region
  has_many :locations

  validates :name, :region, presence: true
end
