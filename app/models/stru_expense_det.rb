class StruExpenseDet < ApplicationRecord

  	belongs_to :structure_expense, inverse_of: :stru_expense_dets
  	validates_presence_of :structure_expense
 
end
