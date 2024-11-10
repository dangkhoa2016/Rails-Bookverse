class BookCategory < ApplicationRecord
  belongs_to :book
  belongs_to :category
  self.table_name = 'books_categories'
end
