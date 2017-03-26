class Implement < ApplicationRecord
  belongs_to :machine
  has_many :cost_oper_machine_details
  validates_presence_of :name, :model, :oper_time, :machine, :coef_cccr, :year, :brand, :price
  
  def get_all_names
    "#{self.name+self.brand}"
  end
  
end
