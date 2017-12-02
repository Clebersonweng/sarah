class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table "products", force: :cascade do |t|
      t.string   "maker"
      t.integer  "unit_of_measurement_id"
      t.string   "tradename"
      t.float    "price"
      t.float    "dosage"
      t.float    "cost_per_hectare"
      t.text     "description"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.index ["unit_of_measurement_id"], name: "index_products_on_unit_of_measurement_id", using: :btree
    end
  end
end