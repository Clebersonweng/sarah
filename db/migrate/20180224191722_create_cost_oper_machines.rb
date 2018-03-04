class CreateCostOperMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_oper_machines do |t|
      t.references :program_production, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
