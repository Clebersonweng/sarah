class CreateSupplyDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :supply_details do |t|
      t.references :supply
      t.references :product, foreign_key: true
      t.float :quantity_needed
      t.float :subtotal

      t.timestamps
    end
  end
end
