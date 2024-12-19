class Tag < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, presence: true, uniqueness: true

  class << self
    def display_columns
      (column_names - ['name']).map do |column_name|
        {
          column_name => 'col-md-6 col-12',
        }
      end
    end
  end
end
