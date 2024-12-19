class Review < ApplicationRecord
  belongs_to :book

  validates :rating, :content, presence: true
  
  class << self
    def display_columns
      result = [{ 'content' => 'col-12' }]
      result + (column_names - ['content']).map do |column_name|
        {
          column_name => 'col-md-6 col-12',
        }
      end
    end
  end
end
