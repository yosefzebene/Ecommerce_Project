class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :locations
  accepts_nested_attributes_for :locations, allow_destroy: true

  validates :firstname, :lastname, :phone, presence: true
  validates :email, uniqueness: true, on: :create
end
