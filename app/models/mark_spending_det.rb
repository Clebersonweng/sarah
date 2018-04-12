class MarkSpendingDet < ApplicationRecord

   belongs_to :mark_spending, inverse_of: :mark_spending_dets
  	validates_presence_of :descr,:amount,:subtotal
end
