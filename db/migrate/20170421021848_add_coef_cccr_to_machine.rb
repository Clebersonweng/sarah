class AddCoefCccrToMachine < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :coeficient_cccr, :float
  end
end
