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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130201235018) do

  create_table "ads", :force => true do |t|
    t.string   "destination",                       :null => false
    t.string   "departure",                         :null => false
    t.date     "departure_on",                      :null => false
    t.time     "departure_at",                      :null => false
    t.integer  "seat_limit",                        :null => false
    t.float    "price_per_seat",                    :null => false
    t.boolean  "highway",        :default => false
    t.text     "itinerary"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "user_id"
    t.integer  "seen",           :default => 0
  end

  create_table "confirmations", :force => true do |t|
    t.string   "token"
    t.integer  "use_count",  :default => 0
    t.integer  "ad_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "pooler_id"
    t.integer  "seats",                         :null => false
    t.integer  "ad_id",                         :null => false
    t.boolean  "seen",       :default => false
    t.boolean  "confirmed",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.text     "message"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                                     :null => false
    t.string   "phone_number"
    t.integer  "year_of_birth"
    t.string   "gender"
    t.boolean  "admin",                  :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "avatar"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.time     "confirmed_at"
    t.time     "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "reset_password_token"
    t.time     "reset_password_sent_at"
    t.time     "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.time     "current_sign_in_at"
    t.time     "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "smoking_allowed",        :default => false
    t.boolean  "luggage_allowed",        :default => true
    t.float    "luggage_weight",         :default => 5.0
    t.boolean  "music_allowed",          :default => true
  end

end
