class Machine < ApplicationRecord
  belongs_to :brand, :model
  has_many :implements, :dependent => :destroy
  has_many :cost_oper_machine_details
  belongs_to :fuel, :dependent => :destroy
  validates_presence_of :name, :brand, :model, :hp
  
  def get_all_names
    "#{self.name+" "+self.brand.name+" "+self.model.name}"
  end
 end
