class FarmingPlot < ApplicationRecord
 
  belongs_to :person
  has_many :estimate_sales, :dependent => :destroy 
  has_many :cost_oper_machine_conts
  validates_presence_of :name,:area, :person
  before_create :add_zeros_to_code #trigger agregar zeros
  
  validates :code, uniqueness: true, length: { maximum: 4 } 
  validates :name, length: { minimum: 3 }
  validates :area, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  validates :description, length: { maximum: 100 }
  # validate :expiration_date_cannot_be_in_the_past_start, :expiration_date_cannot_be_in_the_past_end
  #validates_presence_of :code, :name, :area, :type_of_crop_id, :culture_period_start, :culture_period_end
 
  private
  def expiration_date_cannot_be_in_the_past_start
    errors.add(:culture_period_start, "can't be in the past") if
    !culture_period_start.blank? and culture_period_start < Date.today
  end
  def expiration_date_cannot_be_in_the_past_end
    errors.add(:culture_period_end, "can't be in the past") if
    !culture_period_end.blank? and culture_period_end < Date.today
  end
  
  def add_zeros_to_code 
    codigo = FarmingPlot.maximum(:code) #5
    nuevoCodigo = codigo.to_i + 1 
    nuevoCodigo = nuevoCodigo.to_s.rjust(4, '0')  # => '00005'
    self.code = nuevoCodigo   
  end
end
