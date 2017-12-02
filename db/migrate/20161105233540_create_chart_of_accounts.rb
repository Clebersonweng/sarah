class CreateChartOfAccounts< ActiveRecord::Migration[5.0]
  def change
    create_table :chart_of_accounts do |t|      
      t.string "code"
      t.string "name"
      t.timestamps
    end
  end
end

