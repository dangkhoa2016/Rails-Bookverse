class Genre < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, presence: true, uniqueness: true

  attr_accessor :books_count


  def to_s
    name
  end

  def display_books_count
    books_count || books.count
  end


  class << self
    def display_columns
      [
        "id",
        {
          field: "name",
          only_in_form: true
        },
        "display_books_count",
        "active", "created_at", "updated_at"
      ]
    end
  end
end
