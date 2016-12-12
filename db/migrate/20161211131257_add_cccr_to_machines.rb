class AddCccrToMachines < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :time_oper, :float
  end
end
