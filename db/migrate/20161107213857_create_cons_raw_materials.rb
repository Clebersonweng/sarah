class CreateConsRawMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :cons_raw_materials do |t|
      t.references :program_production, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
