class CreateFarmingPlots < ActiveRecord::Migration[5.0]
  def change
    create_table :farming_plots do |t|
      t.string :code
      t.string :name
      t.float :area
      t.references :type_of_crop, foreign_key: true
      t.date :culture_period_start
      t.date :culture_period_end
      t.string :description

      t.timestamps
    end
  end
end
