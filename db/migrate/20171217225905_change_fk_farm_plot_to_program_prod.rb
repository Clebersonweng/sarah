class ChangeFkFarmPlotToProgramProd < ActiveRecord::Migration[5.0]
  def change
  	rename_column :cost_oper_machine_conts, :farming_plot_id, :program_production_id
  end
end
