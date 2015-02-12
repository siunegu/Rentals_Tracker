# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150212044850) do

  create_table "credit_cards", force: :cascade do |t|
    t.string   "stripe_id"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "stripe_customer_id"
    t.string   "stripe_id"
    t.string   "stripe_access_key"
    t.string   "stripe_publishable_key"
    t.string   "stripe_refresh_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "landlords", ["email"], name: "index_landlords_on_email", unique: true
  add_index "landlords", ["reset_password_token"], name: "index_landlords_on_reset_password_token", unique: true

  create_table "leases", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tenant_id"
    t.integer  "property_id"
    t.string   "stripe_id"
    t.string   "name"
    t.string   "description"
    t.string   "amount"
    t.string   "integer"
    t.string   "interval"
    t.string   "published"
    t.string   "boolean"
    t.integer  "landlord_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "to"
    t.string   "from"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "landlord_id"
    t.integer  "tenant_id"
  end

  add_index "messages", ["landlord_id"], name: "index_messages_on_landlord_id"
  add_index "messages", ["tenant_id"], name: "index_messages_on_tenant_id"

  create_table "plans", force: :cascade do |t|
    t.string   "stripe_id"
    t.string   "name"
    t.text     "description"
    t.integer  "amount"
    t.string   "interval"
    t.boolean  "published"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.integer  "price"
    t.integer  "landlord_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "properties", ["landlord_id"], name: "index_properties_on_landlord_id"

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "tenants", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_id"
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true

end
