class CreateRevaluationCoefficients < ActiveRecord::Migration[5.0]
  def change
    create_table :revaluation_coefficients do |t|
      t.date :start_period
      t.date :end_period
      t.decimal :coefficient, :precision => 6, :scale => 4, :default => 0

      t.timestamps
    end
  end
end
