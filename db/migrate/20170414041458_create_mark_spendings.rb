class CreateMarkSpendings < ActiveRecord::Migration[5.0]
  def change
    create_table :mark_spendings do |t|
      t.references :estimate_sale, foreign_key: true
      t.references :chart_of_account, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
