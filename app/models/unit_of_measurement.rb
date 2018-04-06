class UnitOfMeasurement < ApplicationRecord
   has_many :type_of_services
   has_many :products
   validates_presence_of :coefficient,:name,:abbreviation
end
