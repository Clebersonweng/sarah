class CostOperMachine < ApplicationRecord
  belongs_to :farming_plot
  has_many :cost_oper_machine_details, inverse_of: :cost_oper_machine, :dependent => :destroy
  accepts_nested_attributes_for :cost_oper_machine_details
end
