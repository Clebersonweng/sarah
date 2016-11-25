class Model < ApplicationRecord
  belongs_to :brand
  has_many :machines
  validates_presence_of :name, :brand
  
  
end
