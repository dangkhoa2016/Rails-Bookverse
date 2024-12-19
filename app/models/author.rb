class Author < ApplicationRecord
  has_and_belongs_to_many :books, class_name: 'Book', join_table: 'books_authors'
  has_many :author_profiles, dependent: :destroy

  validates :first_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  class << self
    def display_columns
      column_names
    end
  end
end
