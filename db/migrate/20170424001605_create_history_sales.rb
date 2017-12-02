class CreateHistorySales < ActiveRecord::Migration[5.0]
  def change
    create_table :history_sales do |t|
      t.serial :period
      t.date :date
      t.float :quantity

      t.timestamps
    end
  end
end
