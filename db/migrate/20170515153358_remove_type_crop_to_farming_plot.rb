class RemoveTypeCropToFarmingPlot < ActiveRecord::Migration[5.0]
  def change
    remove_reference :farming_plots, :type_of_crop, index: true
  end
end
