class Member < ApplicationRecord
  belongs_to :library
  has_many :book_loans, dependent: :destroy
  has_many :books, through: :book_loans

  validates :first_name, :email, presence: true

  def full_name
    [ first_name, last_name ].compact.join(" ")
  end
end
