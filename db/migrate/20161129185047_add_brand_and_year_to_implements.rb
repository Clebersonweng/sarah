class AddBrandAndYearToImplements < ActiveRecord::Migration[5.0]
  def change
    add_column :implements, :brand, :string
    add_column :implements, :year, :integer
    add_column :implements, :price, :float
  end
end
