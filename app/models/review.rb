class Review < ApplicationRecord
  belongs_to :book


  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(created_at: :desc) }
  # default_scope { active }


  validates :rating, :content, presence: true


  def to_s
    book&.title
  end

  def header_title
    self.class.human_attribute_name("header_title", book: self.to_s)
  end


  class << self
    def display_columns
      [
        "id",
        {
          field: "book",
          type: "association",
          display_by_actions: [ "index", "show", "edit", "update", "new", "create" ]
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
