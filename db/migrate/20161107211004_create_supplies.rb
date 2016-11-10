class CreateSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :supplies do |t|
      t.string :maker
      t.references :unit_of_measurement, foreign_key: true
      t.string :tradename
      t.float :price
      t.float :dosage
      t.float :cost_per_hectare
      t.text :description

      t.timestamps
    end
  end
end
