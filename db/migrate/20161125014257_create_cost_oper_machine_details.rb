class CreateCostOperMachineDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_oper_machine_details do |t|
      t.references :cost_oper_machine, foreign_key: true
      t.references :machine, foreign_key: true
      t.float :amount
      t.float :fuel
      t.float :lubricant
      t.float :repair_and_maintenance
      t.float :subtotal

      t.timestamps
    end
  end
end
