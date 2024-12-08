class Library < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :book_loans, through: :members


  validates :name, presence: true, uniqueness: true
end
