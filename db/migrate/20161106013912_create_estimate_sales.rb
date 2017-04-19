class CreateEstimateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :estimate_sales do |t|
      t.references :farming_plot, foreign_key: true
      t.references :chart_of_account, foreign_key: true
      t.float :estimate_production
      t.float :total_production
      t.float :price
      t.float :gross_sale

      t.timestamps
    end
  end
end
