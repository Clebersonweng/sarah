class ProgramProduction < ApplicationRecord
  has_one :man_power, :cost_oper_machine_cont, :estimate_sale
end
