class Status < ApplicationRecord
  has_many :orders, dependent: nil

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
end
