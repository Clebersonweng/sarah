class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|      
      t.references :brand, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
