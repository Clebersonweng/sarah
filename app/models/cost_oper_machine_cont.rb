class CostOperMachineCont < ApplicationRecord 
  has_many :cost_oper_machine_cont_details, inverse_of: :cost_oper_machine_cont, :dependent => :destroy
  accepts_nested_attributes_for :cost_oper_machine_cont_details
  #belongs_to :program_production cambiar despues para programa de produccion
  belongs_to :farming_plot
  belongs_to :chart_of_account
  
end
