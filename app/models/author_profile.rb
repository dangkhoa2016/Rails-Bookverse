class AuthorProfile < ApplicationRecord
  belongs_to :author

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(created_at: :desc) }
  # default_scope { active }

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
          display_by_actions: ['index', 'show', 'edit', 'update', 'new', 'create'],
        },
        'bio',
        'social_facebook', 'social_twitter', 'social_instagram', 'social_linkedin', 'social_youtube',
        'active', 'created_at', 'updated_at'
      ]
    end

    def count_by_author_ids(ids)
      model = 'author'
      column_name = "#{model}_id"
      AuthorProfile.where(column_name => ids).group(column_name).count
    end
  end
end
