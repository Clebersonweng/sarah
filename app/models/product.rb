class Product < ApplicationRecord
  belongs_to :unit_of_measurement
  has_many :supplies
  
  validates_presence_of :maker,:price,:tradename, :unit_of_measurement,:dosage,:cost_per_hectare          
  validates :maker, length: { minimum: 3, maximum: 30}, format: { with: /\A[a-zA-Z0-9 ]+\z/}
         
end
