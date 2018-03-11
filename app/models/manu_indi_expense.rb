class ManuIndiExpense < ApplicationRecord
    has_many :manu_indi_expense_dets, inverse_of: :manu_indi_expense, :dependent => :destroy
	accepts_nested_attributes_for :manu_indi_expense_dets
  	belongs_to :program_production
end
