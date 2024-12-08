class Review < ApplicationRecord
  belongs_to :book

  validates :rating, :content, presence: true
end
