class CreateMarkSpendingDets < ActiveRecord::Migration[5.0]
  def change
    create_table :mark_spending_dets do |t|
      t.references :mark_spending, foreign_key: true
      t.string :name
      t.float :amount
      t.text :descr
      t.boolean :is_fixed
      t.float :subtotal

      t.timestamps
    end
  end
end
