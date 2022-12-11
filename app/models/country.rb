class Country < ApplicationRecord
  has_many :regions, dependent: nil

  validates :name, presence: true
end
