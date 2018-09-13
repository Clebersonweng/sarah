class Depreciation < ApplicationRecord
  belongs_to :program_production
  belongs_to :cost_oper_machine
end
