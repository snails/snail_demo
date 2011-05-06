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

ActiveRecord::Schema.define(:version => 20110505023421) do

  create_table "albums", :force => true do |t|
    t.integer  "user_id",     :default => -1
    t.integer  "group_id",    :default => -1
    t.string   "name"
    t.string   "description", :default => ""
    t.integer  "total"
    t.boolean  "privacy",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id", "group_id"], :name => "index_albums_on_user_id_and_group_id"

  create_table "contacts", :force => true do |t|
    t.integer "user_id"
    t.string  "qq",      :default => ""
    t.string  "msn",     :default => ""
    t.string  "phone",   :default => ""
    t.string  "email",   :default => ""
    t.string  "site",    :default => ""
  end

  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "faqs", :force => true do |t|
    t.text    "hobby"
    t.text    "music"
    t.text    "movie"
    t.text    "sport"
    t.text    "book"
    t.text    "skill"
    t.text    "idol"
    t.integer "user_id"
  end

  add_index "faqs", ["user_id"], :name => "index_faqs_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "album_id"
    t.string   "description",        :default => ""
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"

  create_table "specs", :force => true do |t|
    t.integer "user_id",                      :null => false
    t.string  "gender"
    t.date    "birthdate"
    t.string  "city",         :default => ""
    t.string  "occupatation", :default => ""
  end

  add_index "specs", ["user_id"], :name => "index_specs_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                 :default => false
    t.string   "name"
    t.boolean  "actived",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
