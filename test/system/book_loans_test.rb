require "application_system_test_case"

class BookLoansTest < ApplicationSystemTestCase
  setup do
    @book_loan = book_loans(:one)
  end

  test "visiting the index" do
    visit book_loans_url
    assert_selector "h2", text: "List of Book Loans"
  end

  test "should create book loan" do
    visit book_loans_url
    click_on "New Book Loan"
    assert_selector "h2", text: "New Book Loan"

    page.execute_script(<<~JS)
      var bookSel = document.querySelector("select[name='book_loan[book_id]']");
      bookSel.removeAttribute('disabled');
      bookSel.add(new Option("", "#{@book_loan.book_id}", true, true));
      var memberSel = document.querySelector("select[name='book_loan[member_id]']");
      memberSel.removeAttribute('disabled');
      memberSel.add(new Option("", "#{@book_loan.member_id}", true, true));
      var statusSel = document.querySelector("select[name='book_loan[status]']");
      statusSel.removeAttribute('disabled');
      statusSel.add(new Option("", "returned", true, true));
      document.querySelector("input[name='book_loan[borrowed_on]']").value = '#{@book_loan.borrowed_on}';
    JS
    click_on "Create Book Loan"

    assert_text "was successfully created"
    click_on "Back to Book Loans"
  end

  test "should update Book loan" do
    visit edit_book_loan_url(@book_loan)

    click_on "Update Book Loan"

    assert_text "was successfully updated"
    click_on "Back to Book Loans"
  end

  test "should destroy Book loan" do
    visit book_loan_url(@book_loan)
    find("#book_loan_#{@book_loan.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
