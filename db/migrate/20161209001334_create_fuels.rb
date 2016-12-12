class CreateFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :fuels do |t|
      t.string :name
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
