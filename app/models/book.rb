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

  class << self
    def display_columns
      result = [{ 'summary' => 'col-12' }]
      result + (column_names - ['summary', 'title']).map do |column_name|
        {
          column_name => 'col-md-6 col-12',
        }
      end
    end
  end
end
