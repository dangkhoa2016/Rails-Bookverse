require "test_helper"

class BookLoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_loan = book_loans(:one)
  end

  test "should get index" do
    get book_loans_url
    assert_response :success
  end

  test "should get new" do
    get new_book_loan_url
    assert_response :success
  end

  test "should create book_loan" do
    assert_difference("BookLoan.count") do
      post book_loans_url, params: { book_loan: { book_id: @book_loan.book_id, borrowed_on: @book_loan.borrowed_on, member_id: @book_loan.member_id, returned_on: @book_loan.returned_on, status: @book_loan.status } }
    end

    assert_redirected_to book_loan_url(BookLoan.last)
  end

  test "should show book_loan" do
    get book_loan_url(@book_loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_loan_url(@book_loan)
    assert_response :success
  end

  test "should update book_loan" do
    patch book_loan_url(@book_loan), params: { book_loan: { book_id: @book_loan.book_id, borrowed_on: @book_loan.borrowed_on, member_id: @book_loan.member_id, returned_on: @book_loan.returned_on, status: @book_loan.status } }
    assert_redirected_to book_loan_url(@book_loan)
  end

  test "should destroy book_loan" do
    assert_difference("BookLoan.count", -1) do
      delete book_loan_url(@book_loan)
    end

    assert_redirected_to book_loans_url
  end
end
