class CreateManuIndiExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :manu_indi_expenses do |t|
      t.references :program_production, foreign_key: true
      t.references :chart_of_account, foreign_key: true
      t.float :total_fixed
      t.float :total_variable
      t.float :totalFixedAndVariable

      t.timestamps
    end
  end
end
