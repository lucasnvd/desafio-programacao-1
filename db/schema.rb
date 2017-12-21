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

ActiveRecord::Schema.define(version: 20171220221151) do

  create_table "beer_provider_controls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "provider_id"
    t.bigint "beer_id"
    t.index ["beer_id"], name: "index_beer_provider_controls_on_beer_id"
    t.index ["provider_id"], name: "index_beer_provider_controls_on_provider_id"
  end

  create_table "beers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "available", default: 12
    t.decimal "alcohol", precision: 20, scale: 6, default: "0.0"
    t.decimal "price", precision: 20, scale: 6, default: "0.0"
    t.string "malts", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_beer_controls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "beer_id"
    t.bigint "cart_id"
    t.integer "requested_quantity", default: 0
    t.boolean "removed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_cart_beer_controls_on_beer_id"
    t.index ["cart_id"], name: "index_cart_beer_controls_on_cart_id"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "contact_email", null: false
    t.string "contact_phone", null: false
    t.string "name", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "birth_date", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

end
