class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.references :brand, foreign_key: true
      t.references :model, foreign_key: true
      t.float :hp
      t.float :consumption
      t.float :price
      t.date :year_purchase

      t.timestamps
    end
  end
end
