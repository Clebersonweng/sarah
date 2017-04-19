class ChartOfAccount < ApplicationRecord
  has_many :cost_oper_machines
  has_many :cost_oper_machine_conts
  has_many :estimate_sales
  has_many :man_powers
  has_many :manu_indi_expenses
  has_many :structure_expenses
  has_many :mark_spendings
  has_many :supply
  
  validates :code, uniqueness: true
end
