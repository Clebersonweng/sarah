class AddImplementToCostOperMachineDetail < ActiveRecord::Migration[5.0]
  #agregado la columna implemento en la tabla  costo operativo para maquinas propias detalles
  def change
        add_reference :cost_oper_machine_details, :implement, foreign_key: true
  end
end
