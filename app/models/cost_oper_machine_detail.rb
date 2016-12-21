class CostOperMachineDetail < ApplicationRecord
  belongs_to :cost_oper_machine, inverse_of: :cost_oper_machine_details
  belongs_to :machine
  validates_presence_of :name, :brand_id, :model_id, :hp, :consumption, :price, :year_purchase, :coeficient_cccr, :time_oper, :fuel_id

end
