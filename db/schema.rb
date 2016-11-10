# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161107214145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "cons_raw_materials", force: :cascade do |t|
    t.integer  "program_production_id"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["program_production_id"], name: "index_cons_raw_materials_on_program_production_id", using: :btree
  end

  create_table "estimate_sales", force: :cascade do |t|
    t.integer  "farming_plot_id"
    t.float    "estimate_production"
    t.float    "total_production"
    t.float    "price"
    t.float    "gross_sale"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["farming_plot_id"], name: "index_estimate_sales_on_farming_plot_id", using: :btree
  end

  create_table "farming_plots", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.float    "area"
    t.integer  "type_of_crop_id"
    t.date     "culture_period_start"
    t.date     "culture_period_end"
    t.string   "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["type_of_crop_id"], name: "index_farming_plots_on_type_of_crop_id", using: :btree
  end

  create_table "program_productions", force: :cascade do |t|
    t.integer  "estimate_sale_id"
    t.float    "stock_initial"
    t.float    "stock_end"
    t.float    "variation_stock"
    t.float    "program_production"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["estimate_sale_id"], name: "index_program_productions_on_estimate_sale_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string   "maker"
    t.integer  "unit_of_measurement_id"
    t.string   "tradename"
    t.float    "price"
    t.float    "dosage"
    t.float    "cost_per_hectare"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["unit_of_measurement_id"], name: "index_supplies_on_unit_of_measurement_id", using: :btree
  end

  create_table "type_of_crops", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "variety"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_of_measurements", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.float    "coefficient"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role_id"
    t.boolean  "own_machine"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "cons_raw_material_details", "cons_raw_materials"
  add_foreign_key "cons_raw_material_details", "supplies"
  add_foreign_key "cons_raw_materials", "program_productions"
  add_foreign_key "estimate_sales", "farming_plots"
  add_foreign_key "farming_plots", "type_of_crops"
  add_foreign_key "program_productions", "estimate_sales"
  add_foreign_key "supplies", "unit_of_measurements"
end
