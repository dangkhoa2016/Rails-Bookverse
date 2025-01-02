class Author < ApplicationRecord
  has_and_belongs_to_many :books, class_name: 'Book', join_table: 'books_authors'
  has_many :author_profiles, dependent: :destroy

  validates :first_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  attr_accessor :author_profiles_count, :books_count


  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def display_author_profiles_count
    author_profiles_count || author_profiles.count
  end

  def display_books_count
    books_count || books.count
  end

  def to_s
    full_name
  end


  class << self

    def display_columns
      [
        'id',
        'first_name',
        'last_name',
        'email',
        'display_author_profiles_count', 'display_books_count',
        'active', 'created_at', 'updated_at'
      ]
    end
  end
end
