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

ActiveRecord::Schema.define(version: 2019_08_08_084803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer "apple_app_id"
    t.string "android_app_id"
    t.string "title"
    t.string "url"
    t.string "short_description"
    t.string "long_description"
    t.string "icon_url"
    t.string "content_rating"
    t.string "price"
    t.string "dev_name"
    t.string "dev_email"
    t.string "dev_website"
  end

  create_table "dinamic_infos", force: :cascade do |t|
    t.string "country"
    t.date "date"
    t.integer "rank"
    t.float "power"
    t.integer "downloads"
    t.string "shop_type"
    t.string "device"
    t.integer "app_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "keywords"
    t.integer "rank"
    t.string "shop_type"
    t.integer "app_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "package_name"
    t.string "company_name"
    t.integer "review_count"
    t.float "average_rating"
    t.integer "downloads_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "app_id"
  end

  create_table "similar_apps", force: :cascade do |t|
    t.integer "apple_app_id"
    t.string "android_app_id"
    t.integer "app_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "login"
    t.string "name"
    t.string "password"
    t.string "role"
    t.string "image"
  end

end
