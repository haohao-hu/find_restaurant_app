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

ActiveRecord::Schema.define(version: 20170225134406) do

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "neighborhood"
    t.string   "address"
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "stars"
    t.integer  "review_count"
    t.string   "is_open"
    t.string   "alcohol"
    t.boolean  "ambience_romantic"
    t.boolean  "ambience_intimate"
    t.boolean  "ambience_classy"
    t.boolean  "ambience_hipster"
    t.boolean  "ambience_touristy"
    t.boolean  "ambience_trendy"
    t.boolean  "ambience_upscale"
    t.boolean  "ambience_casual"
    t.boolean  "bikeParking"
    t.boolean  "businessAcceptsCreditCards"
    t.boolean  "businessParking_garage"
    t.boolean  "businessParking_street"
    t.boolean  "businessParking_validated"
    t.boolean  "businessParking_lot"
    t.boolean  "businessParking_valet"
    t.boolean  "caters"
    t.boolean  "goodForKids"
    t.boolean  "goodForMeal_dessert"
    t.boolean  "goodForMeal_latenight"
    t.boolean  "goodForMeal_lunch"
    t.boolean  "goodForMeal_dinner"
    t.boolean  "goodForMeal_breakfast"
    t.boolean  "goodForMeal_brunch"
    t.boolean  "hasTV"
    t.string   "noiseLevel"
    t.boolean  "open24Hours"
    t.boolean  "outdoorSeating"
    t.string   "restaurantsAttire"
    t.boolean  "restaurantsDelivery"
    t.boolean  "restaurantsGoodForGroups"
    t.integer  "restaurantsPriceRange2"
    t.boolean  "restaurantsReservations"
    t.boolean  "restaurantsTableService"
    t.boolean  "restaurantsTakeOut"
    t.boolean  "wheelchairAccessible"
    t.string   "wiFi"
    t.string   "categories"
    t.time     "hours_Monday"
    t.time     "hours_Tuesday"
    t.time     "hours_Wednesday"
    t.time     "hours_Thursday"
    t.time     "hours_Friday"
    t.time     "hours_Saturday"
    t.time     "hours_Sunday"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
    t.time     "hours_Monday_end"
    t.time     "hours_Tuesday_end"
    t.time     "hours_Wednesday_end"
    t.time     "hours_Thursday_end"
    t.time     "hours_Friday_end"
    t.time     "hours_Saturday_end"
    t.time     "hours_Sunday_end"
    t.string   "remember_token"
  end

  add_index "restaurants", ["remember_token"], name: "index_restaurants_on_remember_token"

  create_table "reviews", force: :cascade do |t|
    t.float    "stars"
    t.text     "text"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  add_index "reviews", ["user_id", "restaurant_id", "created_at"], name: "index_reviews_on_user_id_and_restaurant_id_and_created_at"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "time_ranges", force: :cascade do |t|
    t.time     "t_start"
    t.time     "t_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.float    "average_stars"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
