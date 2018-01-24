class AddImplementToCostOperMachineCont < ActiveRecord::Migration[5.0]
  def change
  	add_reference :cost_oper_machine_cont_details, :implement, foreign_key: true
  end
end
