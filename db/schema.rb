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

ActiveRecord::Schema.define(version: 20180415153222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "station_number"
    t.integer "position"
    t.time "arrival_time"
    t.time "departure_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "train_id"
    t.bigint "wagon_id"
    t.bigint "railway_station_id"
    t.string "user_name"
    t.string "user_surname"
    t.string "user_patronymic"
    t.integer "start_station_id"
    t.integer "end_station_id"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["railway_station_id"], name: "index_tickets_on_railway_station_id"
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
    t.index ["wagon_id"], name: "index_tickets_on_wagon_id"
  end

  create_table "trains", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_station_id"
    t.bigint "route_id"
    t.boolean "sort_by_tail"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wagons", force: :cascade do |t|
    t.integer "number"
    t.integer "sedentary_seats"
    t.integer "top_seats"
    t.integer "side_top_seats"
    t.integer "bottom_seats"
    t.integer "side_bottom_seats"
    t.bigint "train_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "type"], name: "index_wagons_on_id_and_type"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
