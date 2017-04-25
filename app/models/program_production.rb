class ProgramProduction < ApplicationRecord
  has_one :man_power
  has_one :cost_oper_machine_cont
  belongs_to :estimate_sale
end
