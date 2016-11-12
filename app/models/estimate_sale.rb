class EstimateSale < ApplicationRecord
  has_one :program_production
  belongs_to :farming_plot
  validates_presence_of :estimate_production, :price, :gross_sale

  
   scope :with_classmates, -> { includes(:farming_plot) }
end
