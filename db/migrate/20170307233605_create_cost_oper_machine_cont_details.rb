class CreateCostOperMachineContDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_oper_machine_cont_details do |t|
      t.references :type_of_service, foreign_key: true
      t.float :amount
      t.float :subtotal

      t.timestamps
    end
  end
end
