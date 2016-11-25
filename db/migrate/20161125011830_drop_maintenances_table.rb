class DropMaintenancesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :maintenances
  end
end
