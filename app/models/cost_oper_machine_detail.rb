class CostOperMachineDetail < ApplicationRecord
  belongs_to :cost_oper_machine, inverse_of: :cost_oper_machine_details
  belongs_to :machine
  belongs_to :implement
  has_many :type_services
  validates_presence_of :machine, :implement, :amount, :lubricant, :repair_and_maintenance, :subtotal

end
