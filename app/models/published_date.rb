class PublishedDate < ApplicationRecord
  belongs_to :book
  belongs_to :publisher

  validates :published_date, :edition, presence: true

end
