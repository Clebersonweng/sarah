class ConsRawMaterialDetail < ApplicationRecord
  belongs_to :cons_raw_material, inverse_of: :cons_raw_material_details
  belongs_to :supply
end
