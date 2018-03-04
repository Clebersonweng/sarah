class AddHoursNeededToCostOperOwnMachine < ActiveRecord::Migration[5.0]
  def change
  	add_column :cost_oper_machine_details, :hours_needed, :decimal, :precision => 10, :scale => 3, :default => 0
  end
end
