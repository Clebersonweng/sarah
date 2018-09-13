class CreateDepreciations < ActiveRecord::Migration[5.0]
  def change
    create_table :depreciations do |t|
      t.references :program_production, foreign_key: true
      t.references :cost_oper_machine, foreign_key: true
      t.decimal :total, :precision => 15, :scale => 5, :default => 0

      t.timestamps
    end
  end
end
