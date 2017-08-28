class AddBrandToImplements < ActiveRecord::Migration[5.0]
  def change
     add_column :implements, :brand, :string
     add_column :implements, :year, :date
     add_column :implements, :price, :float
  end
end
