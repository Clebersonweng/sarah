class Implement < ApplicationRecord
  belongs_to :machine
  validates_presence_of :name, :model, :oper_time, :machine, :coef_cccr, :year, :brand, :price
  
  def get_all_names
    "#{self.name+self.brand+self.model}"
  end
  
end
