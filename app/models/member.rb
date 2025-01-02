class Member < ApplicationRecord
  belongs_to :library
  has_many :book_loans, dependent: :destroy
  has_many :books, through: :book_loans


  validates :first_name, :email, presence: true


  attr_accessor :book_loans_count


  def full_name
    [ first_name, last_name ].compact.join(" ")
  end

  def to_s
    full_name
  end

  def display_book_loans_count
    book_loans_count || book_loans.count
  end


  class << self
    def display_columns
      [
        "id",
        "first_name",
        "last_name",
        "email",
        {
          field: "library",
          type: "association"
        },
        "display_book_loans_count",
        "active", "created_at", "updated_at"
      ]
    end
  end
end
