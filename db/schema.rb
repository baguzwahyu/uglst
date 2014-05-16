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

ActiveRecord::Schema.define(version: 20140516063615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "affiliations", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affiliations", ["user_group_id"], name: "index_affiliations_on_user_group_id", using: :btree
  add_index "affiliations", ["user_id", "user_group_id"], name: "index_affiliations_on_user_id_and_user_group_id", unique: true, using: :btree
  add_index "affiliations", ["user_id"], name: "index_affiliations_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "full_street_address"
    t.hstore   "address_parts"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", using: :btree

  create_table "maxmind_geolite_city_blocks", id: false, force: true do |t|
    t.integer "start_ip_num", limit: 8, null: false
    t.integer "end_ip_num",   limit: 8, null: false
    t.integer "loc_id",       limit: 8, null: false
  end

  add_index "maxmind_geolite_city_blocks", ["start_ip_num"], name: "index_maxmind_geolite_city_blocks_on_start_ip_num", unique: true, using: :btree

  create_table "maxmind_geolite_city_location", id: false, force: true do |t|
    t.integer "loc_id",      limit: 8, null: false
    t.string  "country",               null: false
    t.string  "region",                null: false
    t.string  "city"
    t.string  "postal_code",           null: false
    t.float   "latitude"
    t.float   "longitude"
    t.integer "metro_code"
    t.integer "area_code"
  end

  add_index "maxmind_geolite_city_location", ["loc_id"], name: "index_maxmind_geolite_city_location_on_loc_id", unique: true, using: :btree

  create_table "maxmind_geolite_country", id: false, force: true do |t|
    t.string  "start_ip"
    t.string  "end_ip"
    t.integer "start_ip_num", limit: 8, null: false
    t.integer "end_ip_num",   limit: 8, null: false
    t.string  "country_code",           null: false
    t.string  "country",                null: false
  end

  add_index "maxmind_geolite_country", ["start_ip_num"], name: "index_maxmind_geolite_country_on_start_ip_num", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["name"], name: "index_user_groups_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
