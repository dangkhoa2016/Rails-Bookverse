class Review < ApplicationRecord
  belongs_to :book


  validates :rating, :content, presence: true


  def to_s
    book&.title
  end


  class << self
    def display_columns
      [
        "id",
        {
          field: "book",
          type: "association"
        },
        "rating",
        "content",
        "active", "created_at", "updated_at"
      ]
    end

    def count_by_book_ids(ids)
      model = "book"
      column_name = "#{model}_id"
      Review.where(column_name => ids).group(column_name).count("id")
    end
  end
end
