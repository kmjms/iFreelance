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

ActiveRecord::Schema.define(version: 20170907180900) do

  create_table "clients", force: :cascade do |t|
    t.string "user"
    t.string "name"
    t.string "email"
    t.string "password"
    t.float "totalPayments"
    t.date "lastAccess"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "user"
    t.string "email"
    t.string "password"
    t.integer "identifier"
    t.string "name"
    t.string "address"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind_entity_id"
    t.index ["kind_entity_id"], name: "index_entities_on_kind_entity_id"
  end

  create_table "job_logs", force: :cascade do |t|
    t.integer "state_code"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.index ["job_id"], name: "index_job_logs_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "billNumber"
    t.string "name"
    t.float "price"
    t.integer "duration"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "entity_id"
    t.integer "type_job_id"
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["entity_id"], name: "index_jobs_on_entity_id"
    t.index ["type_job_id"], name: "index_jobs_on_type_job_id"
  end

  create_table "kind_entities", force: :cascade do |t|
    t.string "name"
    t.integer "permits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.integer "quotationNumber"
    t.float "price"
    t.integer "duration"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id"
    t.index ["entity_id"], name: "index_quotations_on_entity_id"
  end

  create_table "type_jobs", force: :cascade do |t|
    t.string "name"
    t.integer "skilsRequired"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
