class AddColumnBrandToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :brand_id , :integer
  end
end
