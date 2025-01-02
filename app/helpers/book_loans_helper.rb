module BookLoansHelper
  def render_status_value(value)
    BookLoan.human_attribute_name("status.#{value}")
  end

  def render_status_form_field(form)
    form.select(:status, BookLoan.status_collection_for_select, {}, class: "form-select")
  end
end
