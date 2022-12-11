class Location < ApplicationRecord
  belongs_to :region
  belongs_to :customer

  validates :address, :postalcode, :city, presence: true

  def formatted_location
    "#{self[:address]}, #{self[:city]}, #{region.name} #{self[:postalcode]}"
  end
end
