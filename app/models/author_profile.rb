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

  def social_networks
    attributes.slice("social_facebook", "social_twitter", "social_instagram", "social_linkedin", "social_youtube")
  end


  class << self
    def human_attribute_name(attribute, options = {})
      if attribute == "author" && options[:base].respond_to?(:author) && options[:base].author.blank?
        attribute = "author_id"
      end

      super(attribute, options)
    end

    def display_columns
      [
        "id",
        {
          field: "author",
          type: "association",
          display_by_actions: [ "index", "show", "edit", "update", "new", "create" ]
        },
        "bio",
        {
          field: "social_facebook",
          display_by_actions: [ "edit", "update", "new", "create" ]
        },
        {
          field: "social_twitter",
          display_by_actions: [ "edit", "update", "new", "create" ]
        },
        {
          field: "social_instagram",
          display_by_actions: [ "edit", "update", "new", "create" ]
        },
        {
          field: "social_linkedin",
          display_by_actions: [ "edit", "update", "new", "create" ]
        },
        {
          field: "social_youtube",
          display_by_actions: [ "edit", "update", "new", "create" ]
        },
        {
          field: "social_networks",
          display_by_actions: [ "show", "index" ]
        },
        "active", "created_at", "updated_at"
      ]
    end

    def count_by_author_ids(ids)
      model = "author"
      column_name = "#{model}_id".to_sym
      AuthorProfile.where(column_name => ids).group(column_name).count
    end
  end
end
