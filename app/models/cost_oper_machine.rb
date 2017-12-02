class CostOperMachine < ApplicationRecord
  belongs_to :estimate_sale
  belongs_to :chart_of_account
  has_many :cost_oper_machine_details, inverse_of: :cost_oper_machine, :dependent => :destroy
  accepts_nested_attributes_for :cost_oper_machine_details

  def getNameAndBrandMachine  
    "#{first_name} #{last_name}" 
  end



end
