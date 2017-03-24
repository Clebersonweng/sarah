class CreateCostOperMachineConts < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_oper_machine_conts do |t|
      t.references :farming_plot, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
