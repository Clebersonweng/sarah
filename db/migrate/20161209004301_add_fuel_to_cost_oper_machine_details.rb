class AddFuelToCostOperMachineDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :cost_oper_machine_details, :fuel, foreign_key: true
  end
end
