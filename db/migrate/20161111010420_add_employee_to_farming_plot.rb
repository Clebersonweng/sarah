class AddEmployeeToFarmingPlot < ActiveRecord::Migration[5.0]
  def change
    add_column :farming_plots, :employee_id , :integer
  end
end
