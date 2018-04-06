class TypeOfCrop < ApplicationRecord
  has_many   :estimate_sales
  belongs_to :variety
  validates_presence_of :variety,:name
  
  validates :name, length: { minimum: 3, maximum: 50}, format: { with: /\A[a-zA-Z0-9 ]+\z/}
  validates :code, uniqueness: true, length: { maximum: 4 } 
  before_create :add_zeros_to_code
  
  def name_with_label
    "#{name} tiene el code #{code}"
  end
  
  
  
  private
  def add_zeros_to_code 
    codigo = TypeOfCrop.maximum(:code) #5
    nuevoCodigo = codigo.to_i + 1 
    nuevoCodigo = nuevoCodigo.to_s.rjust(3, '0')  # => '005'
    self.code = nuevoCodigo   
  end
  
end
