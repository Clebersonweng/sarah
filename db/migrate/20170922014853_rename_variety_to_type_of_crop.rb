class RenameVarietyToTypeOfCrop < ActiveRecord::Migration[5.0]
  def change
  	remove_column :type_of_crops, :variety
  end
end
