class Supply < ApplicationRecord
  belongs_to :programProduction
  belongs_to :chartOfAccount
  belongs_to :product
  has_many :supply_details
end
