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

ActiveRecord::Schema.define(version: 20171027032703) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.float "total_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_freelances", id: false, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "freelance_id", null: false
    t.index ["client_id", "freelance_id"], name: "index_clients_freelances_on_client_id_and_freelance_id"
  end

  create_table "detail_invoices", force: :cascade do |t|
    t.string "name_project"
    t.integer "quantity"
    t.string "description"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.float "price"
    t.string "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_expenses_on_project_id"
  end

  create_table "freelances", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.float "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.float "price"
    t.string "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_incomes_on_project_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "number"
    t.date "date_invoice"
    t.date "end_date"
    t.string "name_client"
    t.float "total_value"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.float "progress", default: 0.0
    t.float "price", default: 0.0
    t.integer "client_id"
    t.integer "freelance_id"
    t.integer "type_project_id"
    t.integer "state_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["freelance_id"], name: "index_projects_on_freelance_id"
    t.index ["state_project_id"], name: "index_projects_on_state_project_id"
    t.index ["type_project_id"], name: "index_projects_on_type_project_id"
  end

  create_table "quotation_registries", force: :cascade do |t|
    t.integer "idquotationregistry"
    t.string "date"
    t.string "nameclient"
    t.string "business"
    t.string "product"
    t.integer "value"
    t.integer "validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
