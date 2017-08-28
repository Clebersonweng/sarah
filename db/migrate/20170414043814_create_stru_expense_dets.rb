class CreateStruExpenseDets < ActiveRecord::Migration[5.0]
  def change
    create_table :stru_expense_dets do |t|
      t.references :structure_expense, foreign_key: true
      t.string :name
      t.float :amount
      t.float :subtotal

      t.timestamps
    end
  end
end
