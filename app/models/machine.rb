class Machine < ApplicationRecord
  belongs_to :brand
  belongs_to :model
  has_many :implements, :dependent => :destroy
  has_many :cost_oper_machine_details
  belongs_to :fuel, :dependent => :destroy
  validates_presence_of :name, :brand, :model, :hp, :price, :coeficient_cccr, :consumption, :year_purchase, :fuel_id
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}



  def get_all_names
    "#{self.name+" "+self.brand.name+" "+self.model.name}"
  end
 end
