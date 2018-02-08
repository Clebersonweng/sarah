class ChangeFkToFarmPlotToProgProd < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :cost_oper_machines, :farming_plot, index: true
  	add_column :cost_oper_machines, :program_production_id, :integer
  	add_index :cost_oper_machines, :program_production_id, name: 'idx_cost_oper_machine_on_prog_prod'
  end
end
