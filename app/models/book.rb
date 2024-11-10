class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_and_belongs_to_many :categories
  has_many :reviews, dependent: :destroy
  has_many :book_loans, dependent: :destroy
  has_many :members, through: :book_loans

  validates :title, presence: true
end
