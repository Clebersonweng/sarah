class Supply < ApplicationRecord
  belongs_to :unit_of_measurement
  has_many :cons_raw_material_details, :dependent => :destroy
  
  #scope :ultimos, =>{order["CREATE_AT DESC"].limit(2)}
end
