class CreateManPowerDetails < ActiveRecord::Migration[5.0]
   def change
      create_table :man_power_details do |t|
      t.references :man_power, foreign_key: true
      t.references :type_of_work, foreign_key: true
      t.references :person, foreign_key: true
      t.decimal :hours_needed,:precision => 12, :scale => 4, :default => 0
      t.decimal :subtotal, :precision => 20, :scale => 4, :default => 0

      t.timestamps
      end
   end
end
