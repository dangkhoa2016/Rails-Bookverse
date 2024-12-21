class AuthorProfile < ApplicationRecord
  belongs_to :author

  validates :bio, presence: true


  class << self
    def human_attribute_name(attribute, options = {})
      if attribute == "author" && options[:base].respond_to?(:author) && options[:base].author.blank?
        attribute = "author_id"
      end

      super(attribute, options)
    end
  end
end
