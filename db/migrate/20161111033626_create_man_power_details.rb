class CreateManPowerDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :man_power_details do |t|
      t.references :type_of_work, foreign_key: true
      t.references :employee, foreign_key: true
      t.float :hours_needed
      t.float :subtotal
      
    end
  end
end
