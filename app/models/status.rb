class Status < ApplicationRecord
  has_many :orders

  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
end
