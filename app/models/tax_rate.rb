class TaxRate < ApplicationRecord
  belongs_to :region

  validates :PST, :GST, :HST, numericality: true
end
