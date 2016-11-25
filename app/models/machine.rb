class Machine < ApplicationRecord
  belongs_to :brand
  belongs_to :model
  has_and_belongs_to_many :maintenances
end
