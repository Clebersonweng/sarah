class AddDateEndToEstimateSale < ActiveRecord::Migration[5.0]
  def change
    rename_column :estimate_sales, :date, :date_init
    add_column :estimate_sales, :date_end, :date
    
  end
end
