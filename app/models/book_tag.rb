class BookTag < ApplicationRecord
  belongs_to :book
  belongs_to :tag
  self.table_name = "books_tags"
end
