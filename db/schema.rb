# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_28_090734) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "post_code"
    t.string "phone_number"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "order_lines", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "order_id"
    t.string "item_code"
    t.integer "quantity"
    t.integer "price"
    t.index ["order_id"], name: "index_order_lines_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.integer "amount"
    t.string "payment_mode"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.string "code"
    t.integer "quantity"
    t.integer "price"
    t.string "description1"
    t.string "description2"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.boolean "is_admin"
  end

end
