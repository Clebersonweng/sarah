class AddWorkingCapacityOnImplements < ActiveRecord::Migration[5.0]
  def change
  	add_column :implements, :working_capacity, :decimal, :precision => 6, :scale => 3
  	add_column :implements, :working_capacity_effective, :decimal, :precision => 6, :scale => 3
  	add_column :implements, :field_efficiency, :decimal, :precision => 6, :scale => 3
  end
end
