class CreateRawMaterialDetails < ActiveRecord::Migration[5.0]
  def change
    create_table "cons_raw_material_details", force: :cascade do |t|
      t.integer  "cons_raw_material_id"
      t.integer  "supply_id"
      t.float    "total_unit"
      t.float    "subtotal"
      t.datetime "created_at",           null: false
      t.datetime "updated_at",           null: false
      t.index ["cons_raw_material_id"], name: "index_cons_raw_material_details_on_cons_raw_material_id", using: :btree
      t.index ["supply_id"], name: "index_cons_raw_material_details_on_supply_id", using: :btree
    end
  end
end
