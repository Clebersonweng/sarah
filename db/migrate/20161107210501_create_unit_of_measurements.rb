class CreateUnitOfMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_of_measurements do |t|
      t.string :name
      t.string :abbreviation
      t.float :coefficient

      t.timestamps
    end
  end
end
