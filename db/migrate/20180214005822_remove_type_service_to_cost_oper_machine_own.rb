class RemoveTypeServiceToCostOperMachineOwn < ActiveRecord::Migration[5.0]
  def change
	add_reference :cost_oper_machine_details, :implement, foreign_key: true
  	remove_reference :cost_oper_machine_details, :type_service
  end
end
