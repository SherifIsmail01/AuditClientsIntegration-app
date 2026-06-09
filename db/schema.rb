# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2019_07_14_032827) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apgs", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_apgs_on_year_id"
  end

  create_table "auditors", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bank_statements", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_bank_statements_on_year_id"
  end

  create_table "bod_munites", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_bod_munites_on_year_id"
  end

  create_table "clients", force: :cascade do |t|
    t.text "name"
    t.text "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "year_end"
    t.bigint "auditor_id"
    t.index ["auditor_id"], name: "index_clients_on_auditor_id"
  end

  create_table "confirmations", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_confirmations_on_year_id"
  end

  create_table "files_to_send_to_clients", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_files_to_send_to_clients_on_year_id"
  end

  create_table "other_files", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_other_files_on_year_id"
  end

  create_table "permenants", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_permenants_on_year_id"
  end

  create_table "portals", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_portals_on_year_id"
  end

  create_table "qb_reports", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_qb_reports_on_year_id"
  end

  create_table "qm_resources", force: :cascade do |t|
    t.text "templates"
    t.text "training"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "report_drafts", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_report_drafts_on_year_id"
  end

  create_table "report_packages", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_report_packages_on_year_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_schedules_on_year_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_taxes_on_year_id"
  end

  create_table "testings", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_testings_on_year_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "year_data", force: :cascade do |t|
    t.string "Bank_Statements"
    t.string "Confirmations"
    t.string "Portal"
    t.string "Testing"
    t.string "QB_Reports"
    t.string "Report_draft"
    t.string "Report_package"
    t.string "Files_to_send_to_client"
    t.string "BOD_munites"
    t.string "APG"
    t.string "Schedules"
    t.string "Permenant"
    t.string "Other"
    t.string "Tax"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "years", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "client_id"
    t.string "number"
    t.index ["client_id"], name: "index_years_on_client_id"
  end

  add_foreign_key "apgs", "years"
  add_foreign_key "bank_statements", "years"
  add_foreign_key "bod_munites", "years"
  add_foreign_key "clients", "auditors"
  add_foreign_key "confirmations", "years"
  add_foreign_key "files_to_send_to_clients", "years"
  add_foreign_key "other_files", "years"
  add_foreign_key "permenants", "years"
  add_foreign_key "portals", "years"
  add_foreign_key "qb_reports", "years"
  add_foreign_key "report_drafts", "years"
  add_foreign_key "report_packages", "years"
  add_foreign_key "schedules", "years"
  add_foreign_key "taxes", "years"
  add_foreign_key "testings", "years"
  add_foreign_key "years", "clients"
end
