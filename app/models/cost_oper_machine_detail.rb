class CostOperMachineDetail < ApplicationRecord
  belongs_to :cost_oper_machine, inverse_of: :cost_oper_machine_details
  belongs_to :machine, :implement
  validates_presence_of :machine, :implement, :amount, :lubricant, :repair_and_maintenance, :subtotal

end
