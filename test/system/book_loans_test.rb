require "application_system_test_case"

class BookLoansTest < ApplicationSystemTestCase
  setup do
    @book_loan = book_loans(:one)
  end

  test "visiting the index" do
    visit book_loans_url
    assert_selector "h1", text: "Book loans"
  end

  test "should create book loan" do
    visit book_loans_url
    click_on "New book loan"

    fill_in "Book", with: @book_loan.book_id
    fill_in "Borrowed on", with: @book_loan.borrowed_on
    fill_in "Member", with: @book_loan.member_id
    fill_in "Returned on", with: @book_loan.returned_on
    fill_in "Status", with: @book_loan.status
    click_on "Create Book loan"

    assert_text "Book loan was successfully created"
    click_on "Back"
  end

  test "should update Book loan" do
    visit book_loan_url(@book_loan)
    click_on "Edit this book loan", match: :first

    fill_in "Book", with: @book_loan.book_id
    fill_in "Borrowed on", with: @book_loan.borrowed_on
    fill_in "Member", with: @book_loan.member_id
    fill_in "Returned on", with: @book_loan.returned_on
    fill_in "Status", with: @book_loan.status
    click_on "Update Book loan"

    assert_text "Book loan was successfully updated"
    click_on "Back"
  end

  test "should destroy Book loan" do
    visit book_loan_url(@book_loan)
    click_on "Destroy this book loan", match: :first

    assert_text "Book loan was successfully destroyed"
  end
end
