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

ActiveRecord::Schema.define(version: 20170326141029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  create_table "cost_oper_machine_cont_details", force: :cascade do |t|
    t.integer  "type_of_service_id"
    t.float    "amount"
    t.float    "subtotal"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "unit_of_measurement_id"
    t.index ["type_of_service_id"], name: "index_cost_oper_machine_cont_details_on_type_of_service_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_cost_oper_machine_cont_details_on_unit_of_measurement_id", using: :btree
  end

  create_table "cost_oper_machine_conts", force: :cascade do |t|
    t.integer  "farming_plot_id"
    t.float    "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["farming_plot_id"], name: "index_cost_oper_machine_conts_on_farming_plot_id", using: :btree
  end

  create_table "cost_oper_machine_details", force: :cascade do |t|
    t.integer  "cost_oper_machine_id"
    t.integer  "machine_id"
    t.float    "amount"
    t.float    "lubricant"
    t.float    "repair_and_maintenance"
    t.float    "subtotal"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "implement_id"
    t.float    "fuel"
    t.index ["cost_oper_machine_id"], name: "index_cost_oper_machine_details_on_cost_oper_machine_id", using: :btree
    t.index ["implement_id"], name: "index_cost_oper_machine_details_on_implement_id", using: :btree
    t.index ["machine_id"], name: "index_cost_oper_machine_details_on_machine_id", using: :btree
  end

  create_table "cost_oper_machines", force: :cascade do |t|
    t.integer  "farming_plot_id"
    t.float    "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["farming_plot_id"], name: "index_cost_oper_machines_on_farming_plot_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.float    "salary"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id", using: :btree
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
    t.integer  "employee_id"
    t.index ["type_of_crop_id"], name: "index_farming_plots_on_type_of_crop_id", using: :btree
  end

  create_table "fuels", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "implements", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.float    "oper_time"
    t.integer  "machine_id"
    t.float    "coef_cccr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "brand"
    t.integer  "year"
    t.float    "price"
    t.index ["machine_id"], name: "index_implements_on_machine_id", using: :btree
  end

  create_table "machines", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "model_id"
    t.float    "hp"
    t.float    "consumption"
    t.float    "price"
    t.date     "year_purchase"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "coeficient_cccr"
    t.string   "name"
    t.float    "time_oper"
    t.integer  "fuel_id"
    t.index ["brand_id"], name: "index_machines_on_brand_id", using: :btree
    t.index ["fuel_id"], name: "index_machines_on_fuel_id", using: :btree
    t.index ["model_id"], name: "index_machines_on_model_id", using: :btree
  end

  create_table "man_power_details", force: :cascade do |t|
    t.integer "type_of_work_id"
    t.integer "employee_id"
    t.float   "hours_needed"
    t.float   "subtotal"
    t.integer "man_power_id"
    t.index ["employee_id"], name: "index_man_power_details_on_employee_id", using: :btree
    t.index ["type_of_work_id"], name: "index_man_power_details_on_type_of_work_id", using: :btree
  end

  create_table "man_powers", force: :cascade do |t|
    t.integer  "program_production_id"
    t.float    "total_hours_needed"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["program_production_id"], name: "index_man_powers_on_program_production_id", using: :btree
  end

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "brand_id"
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

  create_table "type_of_services", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "unit_of_measurement_id"
    t.index ["unit_of_measurement_id"], name: "index_type_of_services_on_unit_of_measurement_id", using: :btree
  end

  create_table "type_of_works", force: :cascade do |t|
    t.string   "name"
    t.float    "price_hours"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  add_foreign_key "cons_raw_materials", "program_productions"
  add_foreign_key "cost_oper_machine_cont_details", "type_of_services"
  add_foreign_key "cost_oper_machine_cont_details", "unit_of_measurements"
  add_foreign_key "cost_oper_machine_conts", "farming_plots"
  add_foreign_key "cost_oper_machine_details", "cost_oper_machines"
  add_foreign_key "cost_oper_machine_details", "implements"
  add_foreign_key "cost_oper_machine_details", "machines"
  add_foreign_key "cost_oper_machines", "farming_plots"
  add_foreign_key "employees", "users"
  add_foreign_key "estimate_sales", "farming_plots"
  add_foreign_key "farming_plots", "type_of_crops"
  add_foreign_key "implements", "machines"
  add_foreign_key "machines", "brands"
  add_foreign_key "machines", "fuels"
  add_foreign_key "machines", "models"
  add_foreign_key "man_power_details", "employees"
  add_foreign_key "man_power_details", "type_of_works"
  add_foreign_key "man_powers", "program_productions"
  add_foreign_key "program_productions", "estimate_sales"
  add_foreign_key "supplies", "unit_of_measurements"
  add_foreign_key "type_of_services", "unit_of_measurements"
end
