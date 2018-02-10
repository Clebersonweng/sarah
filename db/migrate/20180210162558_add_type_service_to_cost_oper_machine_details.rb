class AddTypeServiceToCostOperMachineDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :cost_oper_machine_details, :type_service_id, :integer
    add_index :cost_oper_machine_details, :type_service_id, name: 'idx_cost_oper_machine_det_on_type_service_id'
  end
end
