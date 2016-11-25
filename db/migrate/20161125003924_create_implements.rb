class CreateImplements < ActiveRecord::Migration[5.0]
  def change
    create_table :implements do |t|
      t.string :name
      t.string :model
      t.float :oper_time
      t.references :machine, foreign_key: true
      t.float :coef_cccr

      t.timestamps
    end
  end
end
