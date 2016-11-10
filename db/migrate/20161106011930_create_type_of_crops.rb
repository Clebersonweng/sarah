class CreateTypeOfCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :type_of_crops do |t|
      t.string :code
      t.string :name
      t.string :variety

      t.timestamps
    end
  end
end
