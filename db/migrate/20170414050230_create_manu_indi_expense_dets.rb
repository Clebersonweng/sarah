class CreateManuIndiExpenseDets < ActiveRecord::Migration[5.0]
  def change
    create_table :manu_indi_expense_dets do |t|
      t.references :manu_indi_expense,foreign_key: true
      t.string :name
      t.boolean :isFixed
      t.float :subtotal

      t.timestamps
    end
  end
end
