class Library < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :members, dependent: :destroy

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
