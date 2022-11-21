class Location < ApplicationRecord
  belongs_to :city
  belongs_to :customer

  validates :address, :postalcode, presence: true
end
