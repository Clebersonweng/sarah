class CreateCostOperMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_oper_machines do |t|
      t.references :farming_plot, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
