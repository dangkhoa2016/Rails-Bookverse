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

ActiveRecord::Schema[7.1].define(version: 2024_12_17_072144) do
  create_table "author_profiles", force: :cascade do |t|
    t.integer "author_id", null: false
    t.text "bio"
    t.string "social_facebook"
    t.string "social_twitter"
    t.string "social_instagram"
    t.string "social_linkedin"
    t.string "social_youtube"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_author_profiles_on_active"
    t.index ["author_id"], name: "index_author_profiles_on_author_id"
    t.index ["created_at"], name: "index_author_profiles_on_created_at"
    t.index ["social_facebook"], name: "index_author_profiles_on_social_facebook"
    t.index ["social_instagram"], name: "index_author_profiles_on_social_instagram"
    t.index ["social_linkedin"], name: "index_author_profiles_on_social_linkedin"
    t.index ["social_twitter"], name: "index_author_profiles_on_social_twitter"
    t.index ["social_youtube"], name: "index_author_profiles_on_social_youtube"
    t.index ["updated_at"], name: "index_author_profiles_on_updated_at"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_authors_on_active"
    t.index ["created_at"], name: "index_authors_on_created_at"
    t.index ["email"], name: "index_authors_on_email"
    t.index ["first_name"], name: "index_authors_on_first_name"
    t.index ["last_name"], name: "index_authors_on_last_name"
    t.index ["updated_at"], name: "index_authors_on_updated_at"
  end

  create_table "book_loans", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "member_id", null: false
    t.date "borrowed_on"
    t.date "returned_on"
    t.string "status"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_book_loans_on_active"
    t.index ["book_id"], name: "index_book_loans_on_book_id"
    t.index ["borrowed_on"], name: "index_book_loans_on_borrowed_on"
    t.index ["created_at"], name: "index_book_loans_on_created_at"
    t.index ["member_id"], name: "index_book_loans_on_member_id"
    t.index ["returned_on"], name: "index_book_loans_on_returned_on"
    t.index ["status"], name: "index_book_loans_on_status"
    t.index ["updated_at"], name: "index_book_loans_on_updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.string "isbn"
    t.integer "pages"
    t.decimal "price", precision: 8, scale: 2
    t.integer "stock"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_books_on_active"
    t.index ["created_at"], name: "index_books_on_created_at"
    t.index ["isbn"], name: "index_books_on_isbn"
    t.index ["pages"], name: "index_books_on_pages"
    t.index ["price"], name: "index_books_on_price"
    t.index ["stock"], name: "index_books_on_stock"
    t.index ["summary"], name: "index_books_on_summary"
    t.index ["title"], name: "index_books_on_title"
    t.index ["updated_at"], name: "index_books_on_updated_at"
  end

  create_table "books_authors", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "category_id", null: false
  end

  create_table "books_genres", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "books_tags", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_categories_on_active"
    t.index ["created_at"], name: "index_categories_on_created_at"
    t.index ["description"], name: "index_categories_on_description"
    t.index ["name"], name: "index_categories_on_name"
    t.index ["updated_at"], name: "index_categories_on_updated_at"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_genres_on_active"
    t.index ["created_at"], name: "index_genres_on_created_at"
    t.index ["description"], name: "index_genres_on_description"
    t.index ["name"], name: "index_genres_on_name"
    t.index ["updated_at"], name: "index_genres_on_updated_at"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_libraries_on_active"
    t.index ["address"], name: "index_libraries_on_address"
    t.index ["created_at"], name: "index_libraries_on_created_at"
    t.index ["name"], name: "index_libraries_on_name"
    t.index ["updated_at"], name: "index_libraries_on_updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "library_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_members_on_active"
    t.index ["created_at"], name: "index_members_on_created_at"
    t.index ["email"], name: "index_members_on_email"
    t.index ["first_name"], name: "index_members_on_first_name"
    t.index ["last_name"], name: "index_members_on_last_name"
    t.index ["library_id"], name: "index_members_on_library_id"
    t.index ["updated_at"], name: "index_members_on_updated_at"
  end

  create_table "published_dates", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "publisher_id", null: false
    t.date "published_date"
    t.string "edition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["active"], name: "index_published_dates_on_active"
    t.index ["book_id"], name: "index_published_dates_on_book_id"
    t.index ["created_at"], name: "index_published_dates_on_created_at"
    t.index ["edition"], name: "index_published_dates_on_edition"
    t.index ["published_date"], name: "index_published_dates_on_published_date"
    t.index ["publisher_id"], name: "index_published_dates_on_publisher_id"
    t.index ["updated_at"], name: "index_published_dates_on_updated_at"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.integer "established_year"
    t.string "website"
    t.string "ceo_name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_publishers_on_active"
    t.index ["address"], name: "index_publishers_on_address"
    t.index ["ceo_name"], name: "index_publishers_on_ceo_name"
    t.index ["created_at"], name: "index_publishers_on_created_at"
    t.index ["email"], name: "index_publishers_on_email"
    t.index ["established_year"], name: "index_publishers_on_established_year"
    t.index ["name"], name: "index_publishers_on_name"
    t.index ["phone_number"], name: "index_publishers_on_phone_number"
    t.index ["updated_at"], name: "index_publishers_on_updated_at"
    t.index ["website"], name: "index_publishers_on_website"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "book_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_reviews_on_active"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["content"], name: "index_reviews_on_content"
    t.index ["created_at"], name: "index_reviews_on_created_at"
    t.index ["rating"], name: "index_reviews_on_rating"
    t.index ["updated_at"], name: "index_reviews_on_updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_tags_on_active"
    t.index ["created_at"], name: "index_tags_on_created_at"
    t.index ["name"], name: "index_tags_on_name"
    t.index ["updated_at"], name: "index_tags_on_updated_at"
  end

  add_foreign_key "author_profiles", "authors"
  add_foreign_key "book_loans", "books"
  add_foreign_key "book_loans", "members"
  add_foreign_key "members", "libraries"
  add_foreign_key "published_dates", "books"
  add_foreign_key "published_dates", "publishers"
  add_foreign_key "reviews", "books"
end
