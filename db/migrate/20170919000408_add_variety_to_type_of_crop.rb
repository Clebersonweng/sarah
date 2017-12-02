class AddVarietyToTypeOfCrop < ActiveRecord::Migration[5.0]
  def change
    add_reference :type_of_crops, :variety, foreign_key: true
  end
end
