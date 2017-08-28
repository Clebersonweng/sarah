class CreateTypeOfWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :type_of_works do |t|
      t.string :name
      t.float :price_hours
      t.text :description

      t.timestamps
    end
  end
end
