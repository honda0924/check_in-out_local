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

ActiveRecord::Schema.define(version: 2020_12_30_152010) do

  create_table "ios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "in_time"
    t.datetime "out_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_ios_on_student_id"
  end

  create_table "lineusers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "line_uid", null: false
    t.string "line_name"
    t.bigint "student_id"
    t.boolean "already_read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_lineusers_on_student_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "line_uid", null: false
    t.string "reply_token"
    t.string "message_type"
    t.text "message_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_class"
    t.string "student_name", null: false
    t.string "parent_name", null: false
    t.boolean "student_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ios", "students"
  add_foreign_key "lineusers", "students"
end
