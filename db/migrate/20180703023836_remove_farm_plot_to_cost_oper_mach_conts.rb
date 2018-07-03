class RemoveFarmPlotToCostOperMachConts < ActiveRecord::Migration[5.0]
	def change
		remove_reference :cost_oper_machine_conts, :farming_plot
		add_reference :cost_oper_machine_conts, :program_production, foreign_key: true
	end
end
