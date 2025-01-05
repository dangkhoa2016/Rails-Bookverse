class Member < ApplicationRecord
  belongs_to :library
  has_many :book_loans, dependent: :destroy
  has_many :books, through: :book_loans

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(:first_name, :last_name) }
  # default_scope { active }

  validates :first_name, :email, presence: true

  attr_accessor :book_loans_count


  def full_name
    [first_name, last_name].compact.join(' ')
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
        'id',
        'first_name',
        'last_name',
        'email',
        {
          field: 'library',
          type: 'association',
          display_by_actions: ['show', 'index', 'by_book', 'edit', 'update', 'new', 'create'],
        },
        {
          field: 'display_book_loans_count',
        },
        'active', 'created_at', 'updated_at',
      ]
    end

    def count_by_library_ids(ids)
      model = 'library'
      column_name = "#{model}_id"
      Member.where(column_name => ids).group(column_name).count('id')
    end
  end
end
