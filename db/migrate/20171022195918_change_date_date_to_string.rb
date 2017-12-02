class ChangeDateDateToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :machines, :year_purchase, :string
  	change_column :implements, :year, :string
  end
end
