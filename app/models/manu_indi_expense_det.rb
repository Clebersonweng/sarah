class ManuIndiExpenseDet < ApplicationRecord
	belongs_to :manu_indi_expense, inverse_of: :manu_indi_expense_dets
  	validates_presence_of :manu_indi_expense,:descr,:amount,:subtotal

end
