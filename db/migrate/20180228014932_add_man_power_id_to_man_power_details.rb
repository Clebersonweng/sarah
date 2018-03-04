class AddManPowerIdToManPowerDetails < ActiveRecord::Migration[5.0]
  def change
  	add_reference :man_power_details, :man_power, foreign_key: true
  end
end
