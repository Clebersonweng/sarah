class CreateSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :supplies do |t|
     t.references :program_production, foreign_key: true
     t.references :chart_of_account, foreign_key: true
     t.float :total

      t.timestamps
    end
  end
end
