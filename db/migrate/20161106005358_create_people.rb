class CreatePeople < ActiveRecord::Migration[5.0]
    def change
    create_table :people do |t|
      
      t.string :name
      t.string :lastname
      t.float :salary
      t.references :user, foreign_key: true
      t.integer :ruc_ci
      t.string :address
      t.string :phone
      t.date :birthday
      t.string :gender

      t.timestamps
    end
  end
end
