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

ActiveRecord::Schema.define(version: 2019_08_31_114205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "TestUser", id: :bigint, default: nil, force: :cascade do |t|
    t.string "mail", array: true
    t.string "login", array: true
    t.string "password", array: true
  end

  create_table "api_app_last_catch_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_tokens", force: :cascade do |t|
    t.string "value"
    t.integer "credits", default: 100
  end

  create_table "apps", force: :cascade do |t|
    t.integer "apple_app_id"
    t.string "android_app_id"
    t.string "title"
    t.string "apple_url"
    t.string "android_url"
    t.string "short_description"
    t.string "long_description"
    t.string "icon_url"
    t.string "content_rating"
    t.string "price"
    t.string "dev_name"
    t.string "dev_email"
    t.string "dev_website"
    t.float "rating"
    t.index ["android_app_id"], name: "index_apps_on_android_app_id"
    t.index ["apple_app_id"], name: "index_apps_on_apple_app_id"
  end

  create_table "apps_keywords", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "keyword_id"
    t.index ["app_id"], name: "index_apps_keywords_on_app_id"
    t.index ["keyword_id"], name: "index_apps_keywords_on_keyword_id"
  end

  create_table "dynamic_infos", force: :cascade do |t|
    t.string "country"
    t.date "date"
    t.integer "rank"
    t.float "power"
    t.integer "downloads"
    t.string "shop_type"
    t.string "device"
    t.bigint "app_id"
    t.index ["app_id"], name: "index_dynamic_infos_on_app_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "value"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.float "average_rating"
    t.string "google_play_link"
    t.string "icon_link"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating_1"
    t.integer "rating_2"
    t.integer "rating_3"
    t.integer "rating_4"
    t.integer "rating_5"
    t.integer "total_rating"
    t.float "average_rating"
    t.string "shop_type"
    t.date "date"
    t.bigint "app_id"
    t.string "country"
    t.index ["app_id"], name: "index_ratings_on_app_id"
  end

  create_table "similar_apps", force: :cascade do |t|
    t.integer "similar_app_id"
    t.bigint "app_id"
    t.index ["app_id"], name: "index_similar_apps_on_app_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_subscriptions_on_app_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "target_apps", force: :cascade do |t|
    t.string "application_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_countries", force: :cascade do |t|
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
  end

  add_foreign_key "apps_keywords", "apps"
  add_foreign_key "apps_keywords", "keywords"
  add_foreign_key "dynamic_infos", "apps"
  add_foreign_key "ratings", "apps"
  add_foreign_key "similar_apps", "apps"
  add_foreign_key "subscriptions", "apps"
  add_foreign_key "subscriptions", "users"
end
