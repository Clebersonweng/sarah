class TypeOfCrop < ApplicationRecord
  has_many :estimate_sales
  
  validates :name, length: { minimum: 3, maximum: 50}, format: { with: /\A[a-zA-Z]+\z/}
  validates :code, uniqueness: true, length: { maximum: 7 } 
  before_create :add_zeros_to_code
  
  def name_with_label
    "#{name} tiene el code #{code}"
  end
  
  
  
  private
  def add_zeros_to_code 
    codigo = TypeOfCrop.maximum(:code) #5
    nuevoCodigo = codigo.to_i + 1 
    nuevoCodigo = nuevoCodigo.to_s.rjust(7, '0')  # => '00005'
    self.code = nuevoCodigo   
  end
  
end
#def set_account_number
 #   nuevoCodigo = TypeOfCrop.maximum(:code)
#    self.code = nuevoCodigo.to_i + 1
 # end