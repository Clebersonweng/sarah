class RemoveUmToCostOperMachineContDetails < ActiveRecord::Migration[5.0]
  def change
    remove_reference :cost_oper_machine_cont_details, :unit_of_measurement, index: true, foreign_key: true
  end
end
