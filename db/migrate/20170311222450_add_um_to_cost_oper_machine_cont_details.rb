class AddUmToCostOperMachineContDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :cost_oper_machine_cont_details, :unit_of_measurement, foreign_key: true
  end
end