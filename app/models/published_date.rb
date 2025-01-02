class PublishedDate < ApplicationRecord
  belongs_to :book
  belongs_to :publisher

  validates :published_date, :edition, presence: true

  def to_s
    book&.title
  end


  class << self

    def display_columns
      [
        'id',
        {
          field: 'book',
          type: 'association',
        },
        {
          field: 'publisher',
          type: 'association',
        },
        'published_date',
        'edition',
        'active', 'created_at', 'updated_at'
      ]
    end
  end
end
