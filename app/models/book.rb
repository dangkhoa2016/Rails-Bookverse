class Book < ApplicationRecord
  has_and_belongs_to_many :authors, class_name: "Author", join_table: "books_authors"
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :genres
  has_many :reviews, dependent: :destroy
  has_many :book_loans, dependent: :destroy
  has_many :members, through: :book_loans
  has_many :published_dates, dependent: :destroy
  has_many :publishers, through: :published_dates
  # has_one_attached :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"


  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(:title) }
  # default_scope { active }

  validates :title, :summary, :isbn, :pages, presence: true


  attr_accessor :published_dates_count, :publishers_count, :book_loans_count, :reviews_count, :authors_count


  def to_s
    title
  end

  def display_published_dates_count
    published_dates_count || published_dates.count
  end

  def display_publishers_count
    publishers_count || publishers.count
  end

  def display_book_loans_count
    book_loans_count || book_loans.count
  end

  def display_reviews_count
    reviews_count || reviews.count
  end

  def display_authors_count
    authors_count || authors.count
  end


  class << self
    def display_columns
      [
        "id",
        {
          field: "title",
          display_by_actions: [ "edit", "update", "new", "create" ]
        },
        "summary", "isbn", "pages",
        "price", "stock",

        {
          field: "reviews",
          display_by_actions: [ "show", "index", "by_category", "by_author", "by_genre", "by_tag", "edit", "update", "new", "create" ]
        },
        {
          field: "display_reviews_count",
          display_by_actions: [ "show", "by_category", "by_author", "by_genre", "by_tag", "edit", "update", "new", "create" ]
        },
        {
          field: "display_published_dates_count",
          display_by_actions: [ "show", "edit", "update", "new", "create" ]
        },
        {
          field: "display_book_loans_count",
          display_by_actions: [ "show", "edit", "update", "new", "create" ]
        },
        {
          field: "authors",
          display_by_actions: [ "show", "edit", "update", "new", "create" ]
        },
        {
          field: "display_authors_count",
          display_by_actions: [ "show", "edit", "update", "new", "create" ]
        },
        {
          field: "publishers",
          display_by_actions: [ "show", "edit", "update", "new", "create" ]
        },
        {
          field: "display_publishers_count",
          display_by_actions: [ "show", "edit", "update", "new", "create" ]
        },
        "active", "created_at", "updated_at"
      ]
    end

    def count_by_model_ids(model, ids)
      column_name = "#{model}_id".to_sym
      join_table_name = model.to_s.pluralize
      Book.joins(join_table_name.to_sym).
        # where(%Q{ books_#{join_table_name}.#{column_name} in (?) }, ids).
        where({
          "books_#{join_table_name}.#{column_name}".to_sym => ids
        }).
        group(column_name).count(column_name)
    end
  end
end
