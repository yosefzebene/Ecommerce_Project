class Country < ApplicationRecord
  has_many :regions

  validates :name, presence: true
end
