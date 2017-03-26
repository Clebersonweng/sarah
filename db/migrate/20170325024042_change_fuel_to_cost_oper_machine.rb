class ChangeFuelToCostOperMachine < ActiveRecord::Migration[5.0]
  
 # Equivocacion  al cambiar debido a que la maquina ya cuenta con el id y solo se guarda el total gasto con combustible
 # el cual fue necesario modificar nuevamente a lo anterior
 
  def change
    remove_column :cost_oper_machine_details, :fuel, :float
    add_reference :cost_oper_machine_details, :fuel, foreign_key: true
  end
end
