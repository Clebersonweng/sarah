class AddChartOfAccountToCostOPerMachine < ActiveRecord::Migration[5.0]
  def change
    add_reference :cost_oper_machines, :chart_of_account, foreign_key: true
  end
end
