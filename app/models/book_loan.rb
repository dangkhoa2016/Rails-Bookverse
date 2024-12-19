class BookLoan < ApplicationRecord
  belongs_to :book
  belongs_to :member

  enum status: {
    borrowed: 'borrowed',
    returned: 'returned',
    overdue: 'overdue',
    reserved: 'reserved',
    lost: 'lost',
    damaged: 'damaged',
    waiting_for_return: 'waiting_for_return',
    in_transit: 'in_transit',
    available: 'available',
    on_hold: 'on_hold',
    in_processing: 'in_processing',
    renewed: 'renewed',
    cancelled: 'cancelled',
    expired: 'expired'
  }

  validates :status, presence: true
  validates :borrowed_on, presence: true

  class << self
    def display_columns
      (column_names - ['book_id']).map do |column_name|
        {
          column_name => 'col-md-6 col-12',
        }
      end
    end
  end
end
