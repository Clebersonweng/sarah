class AddFkToMachineOnTypeMachine < ActiveRecord::Migration[5.0]
  def change
  	add_column :machines, :type_machine_id, :integer
    add_index :machines, :type_machine_id, name: 'idx_machine_on_type_machine_id'
  end
end
