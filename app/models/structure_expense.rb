class StructureExpense < ApplicationRecord
  belongs_to :program_production
  belongs_to :chart_of_account
  has_many :structure_expense_dets
end
