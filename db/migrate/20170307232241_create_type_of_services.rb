class CreateTypeOfServices < ActiveRecord::Migration[5.0]
  def change
    create_table :type_of_services do |t|
      t.string :name
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
