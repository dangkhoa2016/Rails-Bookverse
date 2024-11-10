json.extract! review, :id, :content, :rating, :book_id, :active, :created_at, :updated_at
json.url review_url(review, format: :json)
