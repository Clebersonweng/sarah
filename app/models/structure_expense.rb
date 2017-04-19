class StructureExpense < ApplicationRecord
  belongs_to :program_production, :chart_of_account
  has_many :structure_expense_dets
end
