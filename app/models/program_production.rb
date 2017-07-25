class ProgramProduction < ApplicationRecord
  has_one :man_power
  has_one :cost_oper_machine_cont
  belongs_to :estimate_sale
  
  
  
  
  validates :stock_end, presence: true, length: { minimum: 3 }
  validates :stock_initial, presence: true,numericality: true, length: { minimum: 3 }
  validates :variation_stock, presence: true,numericality: true
  validates :program_production, presence: true ,length: { minimum: 3 }
  validates :stock_end,numericality: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  validates :stock_initial, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than_or_equal_to => 0}
  validates :variation_stock, numericality: true
end
