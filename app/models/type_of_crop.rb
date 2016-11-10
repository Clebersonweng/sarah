class TypeOfCrop < ApplicationRecord
  has_many :farming_plots,  :dependent => :destroy
  validates_presence_of :name, :code
end
