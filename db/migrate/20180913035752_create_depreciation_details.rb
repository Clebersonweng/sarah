class CreateDepreciationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :depreciation_details do |t|
      t.references :depreciation, foreign_key: true
      t.references :revaluation_coefficient, foreign_key: true
      t.integer :year_use_life
      t.integer :year_use_life_remain
      t.decimal :net_value_prev_year, :precision => 15, :scale => 5, :default => 0
      t.decimal :revalued_value , :precision => 15, :scale => 5, :default => 0
      t.decimal :annual_depre , :precision => 15, :scale => 5, :default => 0
      t.decimal :per_day_depre, :precision => 15, :scale => 5, :default => 0
      t.decimal :per_hour_depre, :precision => 15, :scale => 5, :default => 0
      t.decimal :hours_used, :precision => 15, :scale => 5, :default => 0
      t.decimal :subtotal, :precision => 15, :scale => 5, :default => 0

      t.timestamps
    end
  end
end
