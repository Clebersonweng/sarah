class StructureExpense < ApplicationRecord
  	belongs_to :program_production
  	has_many :stru_expense_dets, inverse_of: :structure_expense, :dependent => :destroy
	accepts_nested_attributes_for :stru_expense_dets, reject_if: proc { |attributes| attributes['name'].blank? }
 
end
