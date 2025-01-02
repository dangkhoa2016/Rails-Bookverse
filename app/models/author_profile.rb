class AuthorProfile < ApplicationRecord
  belongs_to :author

  validates :bio, presence: true

  def to_s
    author&.full_name
  end


  class << self

    def display_columns
      [
        'id',
        {
          field: 'author',
          type: 'association',
        },
        'bio',
        'social_facebook', 'social_twitter', 'social_instagram', 'social_linkedin', 'social_youtube',
        'active', 'created_at', 'updated_at'
      ]
    end

  end
end
