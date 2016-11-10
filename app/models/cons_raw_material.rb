class ConsRawMaterial < ApplicationRecord
  belongs_to :program_production
  has_many :cons_raw_material_details, inverse_of: :cons_raw_material, :dependent => :destroy
  accepts_nested_attributes_for :cons_raw_material_details
  
  
  # client = SELECT farming_plot_id FROM estimate_sales join program_productions on estimate_sales.id = program_productions.estimate_sale_id
  #variable = EstimateSale.find_by_sql( SELECT farming_plot_id FROM estimate_sale join program_productions on estimate_sales.id = program_productions.estimate_sale_id)
  #puts "estoy en cost"+variable 
end
