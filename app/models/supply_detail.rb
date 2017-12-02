class SupplyDetail < ApplicationRecord
  belongs_to :product
  validates_presence_of :product

	belongs_to :supply, inverse_of: :supply_details
 	validates :supply, presence: true
end
