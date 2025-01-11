class PublishedDate < ApplicationRecord
  belongs_to :book
  belongs_to :publisher


  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(:published_date, :edition) }
  # default_scope { active }


  validates :published_date, :edition, presence: true


  def to_s
    book&.title
  end

  def header_title
    self.class.human_attribute_name("header_title", book: self.to_s)
  end


  class << self
    def display_columns
      [
        "id",
        {
          field: "book",
          type: "association",
          display_by_actions: [ "show", "index", "by_publisher", "edit", "update", "new", "create" ]
        },
        {
          field: "publisher",
          type: "association",
          display_by_actions: [ "show", "index", "by_book", "edit", "update", "new", "create" ]
        },
        "published_date",
        "edition",
        "active", "created_at", "updated_at"
      ]
    end

    def count_by_model_ids(model, ids)
      column_name = "#{model}_id".to_sym
      PublishedDate.where(column_name => ids).group(column_name).count("id")
    end
  end
end
