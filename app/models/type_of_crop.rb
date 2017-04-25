class TypeOfCrop < ApplicationRecord
  has_many :farming_plots,  :dependent => :destroy
  validates_presence_of :name, :presence => {message: "Debe agregar un nombre"}
  validates_presence_of :code, :presence => {message: "Debe agregar un codigo "}
  validates :name, length: { minimum: 3 }, :presence => {message: "Debet tener al menos tres digitos"}
  validates :code, uniqueness: true,  :presence => {message: "El codigo no puede repetirse"}
  
  before_create :add_zeros_to_code
  
  def name_with_label
    "#{name} tiene el code #{code}"
  end
  
  
  
  private
  def add_zeros_to_code
   
    self.code ||= TypeOfCrop.find_by_code('0')#code.rjust(2, '0')
    puts self.code
  end
  
end
