class Product < ApplicationRecord
  belongs_to :unit_of_measurement
  has_many :supplies
  #scope :ultimos, =>{order["CREATE_AT DESC"].limit(2)}
end
