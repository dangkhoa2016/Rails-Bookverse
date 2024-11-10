class AuthorProfile < ApplicationRecord
  belongs_to :author

  validates :bio, presence: true
end
