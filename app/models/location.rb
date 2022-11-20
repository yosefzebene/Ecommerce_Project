class Location < ApplicationRecord
  belongs_to :city
  belongs_to :customer
end
