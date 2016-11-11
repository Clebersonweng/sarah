class FarmingPlot < ApplicationRecord
  belongs_to :type_of_crop
  belongs_to :employee
  has_many :estimate_sales
  validate :expiration_date_cannot_be_in_the_past_start, :expiration_date_cannot_be_in_the_past_end
  validates_presence_of :code, :name, :area, :type_of_crop_id, :culture_period_start, :culture_period_end


 	 private
		def expiration_date_cannot_be_in_the_past_start
		    errors.add(:culture_period_start, "can't be in the past") if
		      !culture_period_start.blank? and culture_period_start < Date.today
		end
		def expiration_date_cannot_be_in_the_past_end
		    errors.add(:culture_period_end, "can't be in the past") if
		      !culture_period_end.blank? and culture_period_end < Date.today
		end
end
