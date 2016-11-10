class CreateProgramProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :program_productions do |t|
      t.references :estimate_sale, foreign_key: true
      t.float :stock_initial
      t.float :stock_end
      t.float :variation_stock
      t.float :program_production

      t.timestamps
    end
  end
end
