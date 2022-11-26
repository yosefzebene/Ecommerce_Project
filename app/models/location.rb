class Location < ApplicationRecord
  belongs_to :region
  belongs_to :customer

  validates :address, :postalcode, :city, presence: true
end
