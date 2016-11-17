class TypeOfCrop < ApplicationRecord
  has_many :farming_plots,  :dependent => :destroy
  validates_presence_of :name, :code
  def name_with_label
    "#{name} tiene el code #{code}"
  end
end
