class Customer < ApplicationRecord
  has_many :orders
  has_many :locations

  validates :firstname, :lastname, :email, :phone, presence: true
  validates :email, uniqueness: true, on: :create

  has_secure_password
end
