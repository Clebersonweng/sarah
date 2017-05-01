class UnitOfMeasurement < ApplicationRecord
  has_many :type_of_services
  has_many :products
  
end
