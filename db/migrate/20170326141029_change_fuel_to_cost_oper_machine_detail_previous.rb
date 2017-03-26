class ChangeFuelToCostOperMachineDetailPrevious < ActiveRecord::Migration[5.0]
  def change
    remove_reference :cost_oper_machine_details, :fuel, index: true, foreign_key: true
    add_column :cost_oper_machine_details, :fuel,  :float
  end
end
