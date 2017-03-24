class AddUmToTypeOfService < ActiveRecord::Migration[5.0]
  def change
    add_reference :type_of_services, :unit_of_measurement, foreign_key: true
  end
end
