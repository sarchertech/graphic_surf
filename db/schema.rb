# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081009180842) do

  create_table "post_pictures", :force => true do |t|
    t.integer  "post_id"
    t.string   "reference"
    t.string   "blog_photo_file_name"
    t.string   "blog_photo_content_type"
    t.integer  "blog_photo_file_size"
    t.datetime "blog_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "published",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_pictures", :force => true do |t|
    t.integer  "project_id"
    t.boolean  "primary_picture",    :default => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end