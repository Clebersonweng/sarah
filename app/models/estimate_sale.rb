class EstimateSale < ApplicationRecord
  belongs_to :farming_plot
  belongs_to :type_of_crop
  has_one :program_production
  has_one :cost_oper_machine
  validates_presence_of :estimate_production, :price, :gross_sale, :date
  before_create :add_zeros_to_code
  validates :code, uniqueness: true, length: { maximum: 7 }
  validates :estimate_production, length: { minimum: 1 },length: { maximum: 7 } 
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}

  
  
  
  private
  def add_zeros_to_code 
    codigo = EstimateSale.maximum(:code) #5
    nuevo_codigo = codigo.to_i + 1 
    nuevo_codigo = nuevo_codigo.to_s.rjust(7, '0')  # => '00005'
    self.code = nuevo_codigo   
  end
end
