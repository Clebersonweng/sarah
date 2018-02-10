class AddWorkcapacityOnMachines < ActiveRecord::Migration[5.0]
  def change
  	add_column :machines, :working_capacity, :decimal, :precision => 6, :scale => 3
  	add_column :machines, :working_capacity_effective, :decimal, :precision => 6, :scale => 3
  	add_column :machines, :field_efficiency, :decimal, :precision => 6, :scale => 3
  end
end
