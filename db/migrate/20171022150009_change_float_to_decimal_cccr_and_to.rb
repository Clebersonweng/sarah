class ChangeFloatToDecimalCccrAndTo < ActiveRecord::Migration[5.0]
   def change
      remove_column :machines, :coeficient_cccr
      remove_column :implements, :coef_cccr
      remove_column :machines, :time_oper
      remove_column :implements, :oper_time

      add_column :machines, :coeficient_cccr, :decimal, :precision => 15, :scale => 10
      add_column :machines, :time_oper, :decimal, :precision => 15, :scale => 10	
      add_column :implements, :coef_cccr, :decimal, :precision => 15, :scale => 10
      add_column :implements, :oper_time, :decimal, :precision => 15, :scale => 10
   end

end
