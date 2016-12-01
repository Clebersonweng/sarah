class Machine < ApplicationRecord
  belongs_to :brand
  belongs_to :model
  has_many :implements, :dependent => :destroy
  validates_presence_of :name, :brand, :model
  
  def get_all_names
    "#{self.name+" "+self.brand.name+" "+self.model.name}"
  end
end
