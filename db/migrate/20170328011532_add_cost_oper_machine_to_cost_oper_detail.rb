class AddCostOperMachineToCostOperDetail < ActiveRecord::Migration[5.0]
  # Fue olvidado al momento de crear la referencia master detail para la cabecera de la tabla.
  # el cual fue creado ahora.
  
    def change
       add_column :cost_oper_machine_cont_details, :cost_oper_machine_cont_id, :integer
       add_index :cost_oper_machine_cont_details, :cost_oper_machine_cont_id, name: 'idx_c_oper_machine_and_idx_details'
  end

end
