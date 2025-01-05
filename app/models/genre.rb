class Genre < ApplicationRecord
  has_and_belongs_to_many :books

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(:name) }
  # default_scope { active }

  validates :name, presence: true, uniqueness: true

  attr_accessor :books_count


  def to_s
    name
  end

  def display_books_count
    books_count || books.count
  end


  class << self

    def display_columns
      [
        'id',
        {
          field: 'name',
          display_by_actions: ['edit', 'update', 'new', 'create'],
        },
        {
          field: 'display_books_count',
        },
        'active', 'created_at', 'updated_at',
      ]
    end
  end
end
