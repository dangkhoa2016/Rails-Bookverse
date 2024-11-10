class BookCategory < ApplicationRecord
  belongs_to :book
  belongs_to :genre
  self.table_name = 'books_genres'
end
