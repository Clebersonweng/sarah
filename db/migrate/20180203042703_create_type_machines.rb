class CreateTypeMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :type_machines do |t|
      t.string  :code
      t.string  :description

      t.timestamps
    end
  end
end
