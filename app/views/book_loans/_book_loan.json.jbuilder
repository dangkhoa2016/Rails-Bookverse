json.extract! book_loan, :id, :book_id, :member_id, :borrowed_on, :returned_on, :status, :active, :created_at, :updated_at
json.url book_loan_url(book_loan, format: :json)
