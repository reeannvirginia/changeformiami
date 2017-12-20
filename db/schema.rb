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

ActiveRecord::Schema.define(version: 20171219015053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: :cascade do |t|
    t.float "amount"
    t.bigint "donor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fund_id"
    t.bigint "donor_login_id"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["donor_login_id"], name: "index_donations_on_donor_login_id"
    t.index ["fund_id"], name: "index_donations_on_fund_id"
  end

  create_table "donor_logins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "plaid_access_token"
    t.string "plaid_public_token"
    t.boolean "subscribed"
    t.string "stripeid"
    t.index ["email"], name: "index_donor_logins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_donor_logins_on_reset_password_token", unique: true
  end

  create_table "donors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "goal"
  end

  create_table "organization_funds", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fund_id"], name: "index_organization_funds_on_fund_id"
    t.index ["organization_id"], name: "index_organization_funds_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "address"
    t.string "description"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "donations", "donor_logins"
  add_foreign_key "donations", "donors"
  add_foreign_key "donations", "funds"
  add_foreign_key "organization_funds", "funds"
  add_foreign_key "organization_funds", "organizations"
end
