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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_08_14_064811) do
=======
ActiveRecord::Schema.define(version: 2019_08_14_122603) do
>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: :cascade do |t|
    t.string "value"
    t.integer "credits", default: 100
  end

<<<<<<< HEAD
  create_table "app_keywords", force: :cascade do |t|
    t.integer "priotity"
    t.bigint "application_id"
    t.bigint "keyword_id"
    t.index ["application_id"], name: "index_app_keywords_on_application_id"
    t.index ["keyword_id"], name: "index_app_keywords_on_keyword_id"
  end

  create_table "applications", force: :cascade do |t|
=======
  create_table "apps", force: :cascade do |t|
>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457
    t.integer "apple_app_id"
    t.string "android_app_id"
    t.string "title"
    t.string "apple_url"
<<<<<<< HEAD
    t.string "andriod_url"
=======
    t.string "android_url"
>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457
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

<<<<<<< HEAD
=======
  create_table "apps_keywords", force: :cascade do |t|
    t.integer "priority"
    t.bigint "app_id"
    t.bigint "keyword_id"
    t.index ["app_id"], name: "index_apps_keywords_on_app_id"
    t.index ["keyword_id"], name: "index_apps_keywords_on_keyword_id"
  end

>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457
  create_table "dynamic_infos", force: :cascade do |t|
    t.string "country"
    t.date "date"
    t.integer "rank"
    t.float "power"
    t.integer "downloads"
    t.string "shop_type"
    t.string "device"
<<<<<<< HEAD
    t.bigint "application_id"
    t.index ["application_id"], name: "index_dynamic_infos_on_application_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "keyword"
=======
    t.bigint "app_id"
    t.index ["app_id"], name: "index_dynamic_infos_on_app_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "value"
>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457
    t.string "shop_type"
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
    t.integer "average_rating"
    t.string "shop_type"
    t.date "date"
<<<<<<< HEAD
    t.bigint "application_id"
    t.index ["application_id"], name: "index_ratings_on_application_id"
  end

=======
    t.bigint "app_id"
    t.index ["app_id"], name: "index_ratings_on_app_id"
  end

  create_table "similar_apps", force: :cascade do |t|
    t.integer "similar_app_id"
    t.bigint "app_id"
    t.index ["app_id"], name: "index_similar_apps_on_app_id"
  end

  create_table "subs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "app_id"
    t.index ["app_id"], name: "index_subs_on_app_id"
    t.index ["user_id"], name: "index_subs_on_user_id"
  end

>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457
  create_table "target_apps", force: :cascade do |t|
    t.string "application_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

<<<<<<< HEAD
  add_foreign_key "app_keywords", "applications"
  add_foreign_key "app_keywords", "keywords"
  add_foreign_key "dynamic_infos", "applications"
  add_foreign_key "ratings", "applications"
=======
  add_foreign_key "apps_keywords", "apps"
  add_foreign_key "apps_keywords", "keywords"
  add_foreign_key "dynamic_infos", "apps"
  add_foreign_key "ratings", "apps"
  add_foreign_key "similar_apps", "apps"
  add_foreign_key "subs", "apps"
  add_foreign_key "subs", "users"
>>>>>>> 8207c92354e1614bb8c7ef99e8fc1d394bdd2457
end
