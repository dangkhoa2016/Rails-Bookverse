class Book < ApplicationRecord
  has_and_belongs_to_many :authors, class_name: 'Author', join_table: 'books_authors'
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :genres
  has_many :reviews, dependent: :destroy
  has_many :book_loans, dependent: :destroy
  has_many :members, through: :book_loans

  has_many :published_dates, dependent: :destroy
  has_many :publishers, through: :published_dates

  validates :title, :summary, :isbn, :pages, presence: true

  # has_one_attached :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

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
        'id',
        {
          field: 'title',
          only_in_form: true,
        },
        'summary', 'isbn', 'pages',
        'price', 'stock',
        'display_published_dates_count', 'display_publishers_count',
        'display_book_loans_count', 'display_reviews_count', 'display_authors_count',
        'active', 'created_at', 'updated_at',
      ]
    end
  end
end
