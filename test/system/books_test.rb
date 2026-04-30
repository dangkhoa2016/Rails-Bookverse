require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h2", text: "List of Books"
  end

  test "should create book" do
    visit books_url
    click_on "New Book"

    check "Active" if @book.active
    fill_in "Title", with: "New #{@book.title}"
    fill_in "Summary", with: @book.summary
    fill_in "Isbn", with: @book.isbn
    fill_in "Pages", with: @book.pages
    fill_in "Price", with: @book.price
    fill_in "In Stock", with: @book.stock
    click_on "Create Book"

    assert_text "was successfully created"
    click_on "Back to Books"
  end

  test "should update Book" do
    visit edit_book_url(@book)

    check "Active" if @book.active
    fill_in "Title", with: @book.title
    fill_in "Summary", with: @book.summary
    fill_in "Isbn", with: @book.isbn
    fill_in "Pages", with: @book.pages
    fill_in "Price", with: @book.price
    fill_in "In Stock", with: @book.stock
    click_on "Update Book"

    assert_text "was successfully updated"
    click_on "Back to Books"
  end

  test "should destroy Book" do
    visit book_url(@book)
    find("#book_#{@book.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
