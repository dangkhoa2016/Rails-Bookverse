class AuthorProfile < ApplicationRecord
  belongs_to :author

  validates :bio, presence: true

  class << self
    def display_columns
      result = [{ 'bio' => 'col-12' }]
      result + (column_names - ['bio']).map do |column_name|
        {
          column_name => 'col-md-6 col-12',
        }
      end
    end
  end
end
