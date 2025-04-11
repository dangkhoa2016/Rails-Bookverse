class Library < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :book_loans, through: :members
end
