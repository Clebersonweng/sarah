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

ActiveRecord::Schema.define(version: 20180410041647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chart_of_accounts", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cost_oper_machine_cont_details", force: :cascade do |t|
    t.integer  "type_of_service_id"
    t.float    "amount"
    t.float    "subtotal"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "cost_oper_machine_cont_id"
    t.integer  "implement_id"
    t.index ["cost_oper_machine_cont_id"], name: "idx_cost_oper_machine_cont_detail", using: :btree
    t.index ["implement_id"], name: "index_cost_oper_machine_cont_details_on_implement_id", using: :btree
    t.index ["type_of_service_id"], name: "index_cost_oper_machine_cont_details_on_type_of_service_id", using: :btree
  end

  create_table "cost_oper_machine_conts", force: :cascade do |t|
    t.integer  "program_production_id"
    t.integer  "chart_of_account_id"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["chart_of_account_id"], name: "index_cost_oper_machine_conts_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_cost_oper_machine_conts_on_program_production_id", using: :btree
  end

  create_table "cost_oper_machine_details", force: :cascade do |t|
    t.integer  "cost_oper_machine_id"
    t.integer  "machine_id"
    t.float    "amount"
    t.float    "fuel"
    t.float    "lubricant"
    t.float    "repair_and_maintenance"
    t.float    "subtotal"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "implement_id"
    t.decimal  "hours_needed",           precision: 10, scale: 3, default: "0.0"
    t.index ["cost_oper_machine_id"], name: "index_cost_oper_machine_details_on_cost_oper_machine_id", using: :btree
    t.index ["implement_id"], name: "index_cost_oper_machine_details_on_implement_id", using: :btree
    t.index ["machine_id"], name: "index_cost_oper_machine_details_on_machine_id", using: :btree
  end

  create_table "cost_oper_machines", force: :cascade do |t|
    t.decimal  "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "chart_of_account_id"
    t.integer  "program_production_id"
    t.index ["chart_of_account_id"], name: "index_cost_oper_machines_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_cost_oper_machines_on_program_production_id", using: :btree
  end

  create_table "estimate_sales", force: :cascade do |t|
    t.integer  "farming_plot_id"
    t.integer  "chart_of_account_id"
    t.float    "estimate_production"
    t.float    "total_production"
    t.float    "price"
    t.float    "gross_sale"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.date     "date_init"
    t.string   "code"
    t.integer  "type_of_crop_id"
    t.date     "date_end"
    t.index ["chart_of_account_id"], name: "index_estimate_sales_on_chart_of_account_id", using: :btree
    t.index ["farming_plot_id"], name: "index_estimate_sales_on_farming_plot_id", using: :btree
    t.index ["type_of_crop_id"], name: "index_estimate_sales_on_type_of_crop_id", using: :btree
  end

  create_table "farming_plots", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.float    "area"
    t.integer  "person_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["person_id"], name: "index_farming_plots_on_person_id", using: :btree
  end

  create_table "fuels", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "history_sales", force: :cascade do |t|
    t.serial   "period",     null: false
    t.date     "date"
    t.float    "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implements", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "machine_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "brand"
    t.string   "year"
    t.float    "price"
    t.decimal  "coef_cccr",                  precision: 15, scale: 10
    t.decimal  "oper_time",                  precision: 15, scale: 10
    t.decimal  "working_capacity",           precision: 6,  scale: 3
    t.decimal  "working_capacity_effective", precision: 6,  scale: 3
    t.decimal  "field_efficiency",           precision: 6,  scale: 3
    t.index ["machine_id"], name: "index_implements_on_machine_id", using: :btree
  end

  create_table "machines", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "model_id"
    t.float    "hp"
    t.float    "consumption"
    t.float    "price"
    t.string   "year_purchase"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "name"
    t.integer  "fuel_id"
    t.decimal  "coeficient_cccr",            precision: 15, scale: 10
    t.decimal  "time_oper",                  precision: 15, scale: 10
    t.integer  "type_machine_id"
    t.decimal  "working_capacity",           precision: 6,  scale: 3
    t.decimal  "working_capacity_effective", precision: 6,  scale: 3
    t.decimal  "field_efficiency",           precision: 6,  scale: 3
    t.index ["brand_id"], name: "index_machines_on_brand_id", using: :btree
    t.index ["fuel_id"], name: "index_machines_on_fuel_id", using: :btree
    t.index ["model_id"], name: "index_machines_on_model_id", using: :btree
    t.index ["type_machine_id"], name: "idx_machine_on_type_machine_id", using: :btree
  end

  create_table "man_power_details", force: :cascade do |t|
    t.integer  "man_power_id"
    t.integer  "type_of_work_id"
    t.integer  "person_id"
    t.decimal  "hours_needed",    precision: 12, scale: 4, default: "0.0"
    t.decimal  "subtotal",        precision: 20, scale: 4, default: "0.0"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["man_power_id"], name: "index_man_power_details_on_man_power_id", using: :btree
    t.index ["person_id"], name: "index_man_power_details_on_person_id", using: :btree
    t.index ["type_of_work_id"], name: "index_man_power_details_on_type_of_work_id", using: :btree
  end

  create_table "man_powers", force: :cascade do |t|
    t.integer  "program_production_id"
    t.integer  "chart_of_account_id"
    t.float    "total_hours_needed"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["chart_of_account_id"], name: "index_man_powers_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_man_powers_on_program_production_id", using: :btree
  end

  create_table "manu_indi_expense_dets", force: :cascade do |t|
    t.integer  "manu_indi_expense_id"
    t.string   "name"
    t.boolean  "isFixed"
    t.float    "subtotal"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["manu_indi_expense_id"], name: "index_manu_indi_expense_dets_on_manu_indi_expense_id", using: :btree
  end

  create_table "manu_indi_expenses", force: :cascade do |t|
    t.integer  "program_production_id"
    t.integer  "chart_of_account_id"
    t.float    "total_fixed"
    t.float    "total_variable"
    t.float    "totalFixedAndVariable"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["chart_of_account_id"], name: "index_manu_indi_expenses_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_manu_indi_expenses_on_program_production_id", using: :btree
  end

  create_table "mark_spending_dets", force: :cascade do |t|
    t.integer  "mark_spending_id"
    t.string   "name"
    t.float    "amount"
    t.text     "descr"
    t.boolean  "is_fixed"
    t.float    "subtotal"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["mark_spending_id"], name: "index_mark_spending_dets_on_mark_spending_id", using: :btree
  end

  create_table "mark_spendings", force: :cascade do |t|
    t.integer  "chart_of_account_id"
    t.float    "total"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "program_production_id"
    t.decimal  "total_fixed",           precision: 25, scale: 5
    t.decimal  "total_variable",        precision: 25, scale: 5
    t.index ["chart_of_account_id"], name: "index_mark_spendings_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_mark_spendings_on_program_production_id", using: :btree
  end

  create_table "models", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["brand_id"], name: "index_models_on_brand_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.float    "salary"
    t.integer  "user_id"
    t.integer  "ruc_ci"
    t.string   "address"
    t.string   "phone"
    t.date     "birthday"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_people_on_user_id", using: :btree
  end

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

  create_table "stru_expense_dets", force: :cascade do |t|
    t.integer  "structure_expense_id"
    t.string   "name"
    t.float    "amount"
    t.float    "subtotal"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["structure_expense_id"], name: "index_stru_expense_dets_on_structure_expense_id", using: :btree
  end

  create_table "structure_expenses", force: :cascade do |t|
    t.integer  "program_production_id"
    t.integer  "chart_of_account_id"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["chart_of_account_id"], name: "index_structure_expenses_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_structure_expenses_on_program_production_id", using: :btree
  end

  create_table "supplies", force: :cascade do |t|
    t.integer  "program_production_id"
    t.integer  "chart_of_account_id"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["chart_of_account_id"], name: "index_supplies_on_chart_of_account_id", using: :btree
    t.index ["program_production_id"], name: "index_supplies_on_program_production_id", using: :btree
  end

  create_table "supply_details", force: :cascade do |t|
    t.integer  "supply_id"
    t.integer  "product_id"
    t.float    "quantity_needed"
    t.float    "subtotal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["product_id"], name: "index_supply_details_on_product_id", using: :btree
    t.index ["supply_id"], name: "index_supply_details_on_supply_id", using: :btree
  end

  create_table "type_machines", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_of_crops", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "variety_id"
    t.index ["variety_id"], name: "index_type_of_crops_on_variety_id", using: :btree
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

  create_table "varieties", force: :cascade do |t|
    t.string   "code"
    t.string   "descr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cost_oper_machine_cont_details", "implements"
  add_foreign_key "cost_oper_machine_cont_details", "type_of_services"
  add_foreign_key "cost_oper_machine_conts", "chart_of_accounts"
  add_foreign_key "cost_oper_machine_conts", "farming_plots", column: "program_production_id"
  add_foreign_key "cost_oper_machine_details", "cost_oper_machines"
  add_foreign_key "cost_oper_machine_details", "implements"
  add_foreign_key "cost_oper_machine_details", "machines"
  add_foreign_key "cost_oper_machines", "chart_of_accounts"
  add_foreign_key "cost_oper_machines", "program_productions"
  add_foreign_key "estimate_sales", "chart_of_accounts"
  add_foreign_key "estimate_sales", "farming_plots"
  add_foreign_key "estimate_sales", "type_of_crops"
  add_foreign_key "farming_plots", "people"
  add_foreign_key "implements", "machines"
  add_foreign_key "machines", "brands"
  add_foreign_key "machines", "fuels"
  add_foreign_key "machines", "models"
  add_foreign_key "man_power_details", "man_powers"
  add_foreign_key "man_power_details", "people"
  add_foreign_key "man_power_details", "type_of_works"
  add_foreign_key "man_powers", "chart_of_accounts"
  add_foreign_key "man_powers", "program_productions"
  add_foreign_key "manu_indi_expense_dets", "manu_indi_expenses"
  add_foreign_key "manu_indi_expenses", "chart_of_accounts"
  add_foreign_key "manu_indi_expenses", "program_productions"
  add_foreign_key "mark_spending_dets", "mark_spendings"
  add_foreign_key "mark_spendings", "chart_of_accounts"
  add_foreign_key "mark_spendings", "program_productions"
  add_foreign_key "models", "brands"
  add_foreign_key "people", "users"
  add_foreign_key "program_productions", "estimate_sales"
  add_foreign_key "stru_expense_dets", "structure_expenses"
  add_foreign_key "structure_expenses", "chart_of_accounts"
  add_foreign_key "structure_expenses", "program_productions"
  add_foreign_key "supplies", "chart_of_accounts"
  add_foreign_key "supplies", "program_productions"
  add_foreign_key "supply_details", "products"
  add_foreign_key "type_of_crops", "varieties"
  add_foreign_key "type_of_services", "unit_of_measurements"
end
