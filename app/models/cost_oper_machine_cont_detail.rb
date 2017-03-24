class CostOperMachineContDetail < ApplicationRecord
  belongs_to :cost_oper_machine_cont
  belongs_to :type_of_service
  belongs_to :unit_of_measurement
end
