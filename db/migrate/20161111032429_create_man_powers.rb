class CreateManPowers < ActiveRecord::Migration[5.0]
  def change
    create_table :man_powers do |t|
      t.references :program_production, foreign_key: true
      t.float :total_hours_needed
      t.float :total

      t.timestamps
    end
  end
end
