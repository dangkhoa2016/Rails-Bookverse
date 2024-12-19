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

    def status_collection_for_select(options = {})
      BookLoan.statuses.map do |status, _|
        [BookLoan.human_attribute_name("status.#{status}", options), status]
      end
    end

    def human_attribute_name(field, options = {})
      field = field.to_s
      if field.start_with?('status.')
        I18n.t("activerecord.attributes.book_loan.#{field}", **options)
      elsif field == 'status'
        I18n.t("activerecord.attributes.book_loan.#{field}_enum", **options)
      else
        super
      end
    end
  end
end
