class TypeOfService < ApplicationRecord
  has_many :cost_oper_machine_cont_details
  belongs_to :unit_of_measurement
end
