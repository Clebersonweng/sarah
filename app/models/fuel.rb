class Fuel < ApplicationRecord
  has_many :cost_oper_machine_detail
  validates_presence_of :name
  validates_presence_of :price
end
