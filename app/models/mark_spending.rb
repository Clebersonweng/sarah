class MarkSpending < ApplicationRecord
   belongs_to :program_production
   #belogs_to :chart_of_account
  	has_many :mark_spending_dets, inverse_of: :mark_spending, :dependent => :destroy
	accepts_nested_attributes_for :mark_spending_dets
	validates_presence_of :program_production,:total,:total_fixed,:total_variable

end
