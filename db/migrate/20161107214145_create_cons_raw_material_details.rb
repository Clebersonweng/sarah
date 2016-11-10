class CreateConsRawMaterialDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :cons_raw_material_details do |t|
      t.references :cons_raw_material, foreign_key: true
      t.references :supply, foreign_key: true
      t.float :total_unit
      t.float :subtotal

      t.timestamps
    end
  end
end
