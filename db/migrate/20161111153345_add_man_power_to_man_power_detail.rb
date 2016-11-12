class AddManPowerToManPowerDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :man_power_details, :man_power_id , :integer
  end
end
