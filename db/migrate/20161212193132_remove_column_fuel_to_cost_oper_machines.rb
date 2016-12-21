class RemoveColumnFuelToCostOperMachines < ActiveRecord::Migration[5.0]
  def change
    remove_column :cost_oper_machine_details, :fuel_id
    add_reference :machines, :fuel, foreign_key: true
  end
end
