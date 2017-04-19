class EstimateSale < ApplicationRecord
  belongs_to :farming_plot
  belongs_to :chart_of_account
  has_one :program_production
  has_one :cost_oper_machine
  validates_presence_of :estimate_production, :price, :gross_sale
end
