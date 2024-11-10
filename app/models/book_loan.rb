class BookLoan < ApplicationRecord
  belongs_to :book
  belongs_to :member

  enum status: { borrowed: 'borrowed', returned: 'returned' }

  validates :status, presence: true
  validates :borrowed_on, presence: true
end
