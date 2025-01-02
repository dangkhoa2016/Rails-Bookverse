module BookLoansHelper
  def render_status_value(value)
    BookLoan.human_attribute_name("status.#{value}")
  end
end
