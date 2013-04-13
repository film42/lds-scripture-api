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

ActiveRecord::Schema.define(:version => 20130410183504) do

  create_table "books", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "volume_id"
    t.string  "book_title",       :limit => 22
    t.string  "book_title_jst",   :limit => 27
    t.string  "book_title_long",  :limit => 59
    t.string  "book_title_short", :limit => 8
    t.string  "book_subtitle",    :limit => 80
    t.string  "lds_org",          :limit => 6
    t.integer "num_chapters"
    t.integer "num_verses"
  end

  add_index "books", ["id"], :name => "index_books_on_id"
  add_index "books", ["volume_id"], :name => "index_books_on_volume_id"

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "verses", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "volume_id"
    t.integer "book_id"
    t.integer "chapter"
    t.integer "verse"
    t.integer "pilcrow"
    t.text    "verse_scripture"
    t.string  "verse_title",       :limit => 30
    t.string  "verse_title_short", :limit => 14
    t.tsvecor "verseText"
  end

  add_index "verses", ["book_id"], :name => "index_verses_on_book_id"
  add_index "verses", ["id"], :name => "index_verses_on_id"
  add_index "verses", ["volume_id"], :name => "index_verses_on_volume_id"

  create_table "volumes", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "volume_title",      :limit => 22
    t.string  "volume_title_long", :limit => 26
    t.string  "volume_subtitle",   :limit => 36
    t.string  "lds_org",           :limit => 4
    t.integer "num_chapters"
    t.integer "num_verses"
  end

  add_index "volumes", ["id"], :name => "index_volumes_on_id"

end
