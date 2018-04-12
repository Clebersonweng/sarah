class RemoveEstimSaleToMarkSpending < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :mark_spendings, :estimate_sale
  	add_reference :mark_spendings, :program_production, foreign_key: true
  end
end
