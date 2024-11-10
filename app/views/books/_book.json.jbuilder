json.extract! book, :id, :title, :summary, :isbn, :pages, :price, :stock, :active, :created_at, :updated_at
json.url book_url(book, format: :json)
