class AddTypeCropToEstimateSale < ActiveRecord::Migration[5.0]
  def change
    add_column :estimate_sales, :code, :string
    add_reference :estimate_sales, :type_of_crop, foreign_key: true, index: true
  end
end
