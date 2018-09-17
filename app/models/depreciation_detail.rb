class DepreciationDetail < ApplicationRecord
   belongs_to :depreciation, inverse_of: :depreciation_details
   belongs_to :revaluation_coefficient

   validates_presence_of :revaluation_coefficient_id, :depreciation_id

   after_save :update_total

   private
      def update_total
      



      end

end
