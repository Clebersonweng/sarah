class AddFkCostOpermachContToCoMContDet < ActiveRecord::Migration[5.0]
  def change
  	add_column :cost_oper_machine_cont_details, :cost_oper_machine_cont_id, :integer
    add_index :cost_oper_machine_cont_details, :cost_oper_machine_cont_id, name: 'idx_cost_oper_machine_cont_detail'
  end
end
