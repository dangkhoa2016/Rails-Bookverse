require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    check "Active" if @book.active
    fill_in "Isbn", with: @book.isbn
    fill_in "Pages", with: @book.pages
    fill_in "Price", with: @book.price
    fill_in "Stock", with: @book.stock
    fill_in "Summary", with: @book.summary
    fill_in "Title", with: @book.title
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "should update Book" do
    visit book_url(@book)
    click_on "Edit this book", match: :first

    check "Active" if @book.active
    fill_in "Isbn", with: @book.isbn
    fill_in "Pages", with: @book.pages
    fill_in "Price", with: @book.price
    fill_in "Stock", with: @book.stock
    fill_in "Summary", with: @book.summary
    fill_in "Title", with: @book.title
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should destroy Book" do
    visit book_url(@book)
    click_on "Destroy this book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
