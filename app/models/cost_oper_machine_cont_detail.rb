class CostOperMachineContDetail < ApplicationRecord
  belongs_to :cost_oper_machine_cont, inverse_of: :cost_oper_machine_cont_details
  belongs_to :type_of_service
  
  
end
