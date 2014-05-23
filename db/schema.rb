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

ActiveRecord::Schema.define(:version => 20140516190245) do

  create_table "beer_descriptions", :force => true do |t|
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.integer  "brewery_id"
    t.string   "abv"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "post_id"
    t.integer  "ibu"
    t.integer  "style_id"
  end

  add_index "beers", ["brewery_id"], :name => "index_beers_on_brewery_id"
  add_index "beers", ["ibu"], :name => "index_beers_on_ibu"
  add_index "beers", ["style_id"], :name => "index_beers_on_style_id"

  create_table "breweries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "post_id"
    t.integer  "location_id"
    t.integer  "beer_id"
  end

  add_index "breweries", ["beer_id"], :name => "index_breweries_on_beer_id"
  add_index "breweries", ["location_id"], :name => "index_breweries_on_location_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "brewery_id"
    t.integer  "beer_id"
  end

  add_index "comments", ["beer_id"], :name => "index_comments_on_beer_id"
  add_index "comments", ["brewery_id"], :name => "index_comments_on_brewery_id"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "brewery_id"
  end

  add_index "locations", ["brewery_id"], :name => "index_locations_on_brewery_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "beer_id"
    t.integer  "location_id"
    t.string   "image"
    t.integer  "brewery_id"
    t.integer  "style_id"
  end

  add_index "posts", ["beer_id"], :name => "index_posts_on_beer_id"
  add_index "posts", ["brewery_id"], :name => "index_posts_on_brewery_id"
  add_index "posts", ["location_id"], :name => "index_posts_on_location_id"
  add_index "posts", ["style_id"], :name => "index_posts_on_style_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "beer_id"
    t.integer  "post_id"
  end

  add_index "styles", ["beer_id"], :name => "index_styles_on_beer_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
