class AddFkToManyTables < ActiveRecord::Migration[5.0]
    def change
  	   remove_column :cost_oper_machines, :program_production_id
  	   add_reference :cost_oper_machines, :program_production, foreign_key: true
    end
end
