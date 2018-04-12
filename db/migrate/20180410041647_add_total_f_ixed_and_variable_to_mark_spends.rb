class AddTotalFIxedAndVariableToMarkSpends < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :mark_spendings, :total_fixed,:decimal, :precision => 25, :scale => 5
  	  	add_column :mark_spendings, :total_variable, :decimal, :precision => 25, :scale => 5
  end
end
