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

ActiveRecord::Schema.define(version: 20170829230503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "active_tables", force: :cascade do |t|
    t.date     "date"
    t.string   "day_week"
    t.string   "time_spending"
    t.string   "training_name"
    t.string   "teacher"
    t.integer  "place"
    t.integer  "place_current"
    t.boolean  "active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.time     "time_start"
    t.integer  "no_registration"
    t.integer  "teacher_id"
  end

  create_table "active_tables_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "active_table_id"
    t.index ["active_table_id"], name: "index_active_tables_users_on_active_table_id", using: :btree
    t.index ["user_id"], name: "index_active_tables_users_on_user_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "albums", force: :cascade do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "position"
    t.boolean  "publish"
  end

  create_table "cash_sorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cashes", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "date_finish"
    t.integer  "cash_sort_id"
    t.string   "last_name"
    t.integer  "cash_count"
    t.index ["cash_sort_id"], name: "index_cashes_on_cash_sort_id", using: :btree
  end

  create_table "cashes_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "cash_id"
    t.index ["cash_id"], name: "index_cashes_users_on_cash_id", using: :btree
    t.index ["user_id"], name: "index_cashes_users_on_user_id", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "slide_image_id"
    t.string   "name"
    t.string   "name_shot"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["slide_image_id"], name: "index_contents_on_slide_image_id", using: :btree
  end

  create_table "contents_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_id"
    t.index ["content_id"], name: "index_contents_users_on_content_id", using: :btree
    t.index ["user_id"], name: "index_contents_users_on_user_id", using: :btree
  end

  create_table "day_weeks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "album_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["album_id"], name: "index_images_on_album_id", using: :btree
  end

  create_table "meets", force: :cascade do |t|
    t.date     "date"
    t.string   "description"
    t.string   "time_start"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "select_boxes", force: :cascade do |t|
    t.string   "name"
    t.string   "name_shot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "select_cashes", force: :cascade do |t|
    t.integer  "count"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "cash_sort_id"
    t.boolean  "subscription"
    t.index ["cash_sort_id"], name: "index_select_cashes_on_cash_sort_id", using: :btree
  end

  create_table "slide_images", force: :cascade do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "position"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.boolean  "active"
    t.integer  "count"
    t.date     "date_start"
    t.date     "date_finish"
    t.integer  "cash_id"
    t.integer  "select_cash_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "price"
    t.boolean  "paid"
    t.boolean  "order_destroy"
    t.boolean  "confirm"
    t.datetime "date_paid"
    t.integer  "teacher_id"
    t.string   "teacher_name"
    t.index ["cash_id"], name: "index_subscriptions_on_cash_id", using: :btree
    t.index ["select_cash_id"], name: "index_subscriptions_on_select_cash_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "table_publishes", force: :cascade do |t|
    t.string   "day_week"
    t.string   "time_spending"
    t.string   "training_name"
    t.string   "name_shot"
    t.string   "teacher"
    t.integer  "place"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.time     "time_start"
    t.integer  "teacher_id"
  end

  create_table "time_spendings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time     "time_start"
  end

  create_table "timetables", force: :cascade do |t|
    t.integer  "day_week_id"
    t.integer  "time_spending_id"
    t.integer  "training_name_id"
    t.integer  "place"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.index ["day_week_id"], name: "index_timetables_on_day_week_id", using: :btree
    t.index ["time_spending_id"], name: "index_timetables_on_time_spending_id", using: :btree
    t.index ["training_name_id"], name: "index_timetables_on_training_name_id", using: :btree
    t.index ["user_id"], name: "index_timetables_on_user_id", using: :btree
  end

  create_table "training_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name_shot"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "specialty"
    t.string   "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "cash_sort_id"
    t.date     "birth_date"
    t.string   "social_link"
    t.string   "message"
    t.string   "head_message"
    t.boolean  "confirm"
    t.index ["cash_sort_id"], name: "index_users_on_cash_sort_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "cashes", "cash_sorts"
  add_foreign_key "select_cashes", "cash_sorts"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "users", "cash_sorts"
end
