class AddDateToEstimateSale < ActiveRecord::Migration[5.0]
  def change
    add_column :estimate_sales, :date, :date
  end
end
