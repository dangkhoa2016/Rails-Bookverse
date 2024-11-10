# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_10_091446) do
  create_table "author_profiles", force: :cascade do |t|
    t.integer "author_id", null: false
    t.text "bio"
    t.text "social_links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_profiles_on_author_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_loans", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "member_id", null: false
    t.date "borrowed_on"
    t.date "returned_on"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_loans_on_book_id"
    t.index ["member_id"], name: "index_book_loans_on_member_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.date "published_date"
    t.integer "author_id", null: false
    t.integer "publisher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "category_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_members_on_library_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
  end

  add_foreign_key "author_profiles", "authors"
  add_foreign_key "book_loans", "books"
  add_foreign_key "book_loans", "members"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "publishers"
  add_foreign_key "members", "libraries"
  add_foreign_key "reviews", "books"
end
