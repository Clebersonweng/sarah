class CostOperMachineCont < ApplicationRecord
  belongs_to :farming_plot_id
  has_many :cost_oper_machine_cont_details
  
end
