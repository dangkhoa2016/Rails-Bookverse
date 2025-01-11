module BookLoansHelper
  def book_loan_render_status_value(value)
    BookLoan.human_attribute_name("status.#{value}")
  end

  def book_loan_render_status_form_field(form)
    form.select(:status, BookLoan.status_collection_for_select, {}, class: "form-select")
  end

  def book_loan_display_card_header_title(record)
    record.header_title
  end
end
