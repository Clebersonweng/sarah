class DepreciationDetail < ApplicationRecord
  belongs_to :depreciation
  belongs_to :cost_oper_machine
  belongs_to :revaluation_coefficient
end
