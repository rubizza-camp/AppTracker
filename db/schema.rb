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

ActiveRecord::Schema.define(version: 2019_08_12_101311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_keywords", force: :cascade do |t|
    t.integer "priotity"
    t.bigint "application_id"
    t.bigint "keyword_id"
    t.index ["application_id"], name: "index_app_keywords_on_application_id"
    t.index ["keyword_id"], name: "index_app_keywords_on_keyword_id"
  end

  create_table "applications", force: :cascade do |t|
    t.integer "apple_app_id"
    t.string "android_app_id"
    t.string "title"
    t.string "apple_url"
    t.string "andriod_url"
    t.string "short_description"
    t.string "long_description"
    t.string "icon_url"
    t.string "content_rating"
    t.string "price"
    t.string "dev_name"
    t.string "dev_email"
    t.string "dev_website"
    t.json "similar_apps"
  end

  create_table "dynamic_infos", force: :cascade do |t|
    t.string "country"
    t.date "date"
    t.integer "rank"
    t.float "power"
    t.integer "downloads"
    t.string "shop_type"
    t.string "device"
    t.bigint "application_id"
    t.index ["application_id"], name: "index_dynamic_infos_on_application_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "keyword"
    t.string "shop_type"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating_1"
    t.integer "rating_2"
    t.integer "rating_3"
    t.integer "rating_4"
    t.integer "rating_5"
    t.integer "total_rating"
    t.integer "average_rating"
    t.string "shop_type"
    t.date "date"
    t.bigint "application_id"
    t.index ["application_id"], name: "index_ratings_on_application_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "login"
    t.string "name"
    t.string "password"
    t.string "role"
    t.string "image"
    t.json "subscriptions"
  end

  add_foreign_key "app_keywords", "applications"
  add_foreign_key "app_keywords", "keywords"
  add_foreign_key "dynamic_infos", "applications"
  add_foreign_key "ratings", "applications"
end
