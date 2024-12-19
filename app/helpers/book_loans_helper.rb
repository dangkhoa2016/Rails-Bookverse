module BookLoansHelper
  def book_loan_status_display_value(book, column)
    value = book.send(column)
    BookLoan.human_attribute_name("status.#{value}")
  end
end
