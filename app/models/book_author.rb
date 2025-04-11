class BookAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author
  self.table_name = "books_authors"
end
