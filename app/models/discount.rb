class Discount < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, uniqueness: true, presence: true, length: { maximum: 100 }
  validates :valid_until, presence: true
  validates :percent, numericality: true, presence: true
  validates :note, length: { maximum: 2_000 }
end
