class MarkSpending < ApplicationRecord
  belongs_to :estimate_sale, :chart_of_account
  has_many :mark_spending_dets
end
