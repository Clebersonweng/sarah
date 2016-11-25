class Machine < ApplicationRecord
  belongs_to :brand
  belongs_to :model
  has_many :implements
end
