class AddTimeOperToMachine < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :time_oper, :string
   add_reference :machines, :fuel, foreign_key: true
  end
end
