class Publisher < ApplicationRecord
  has_many :published_dates, dependent: :destroy
  has_many :books, through: :published_dates

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :sorted, -> { order(:name) }
  # default_scope { active }

  validates :name, presence: true, uniqueness: true

  attr_accessor :published_dates_count


  def to_s
    name
  end

  def display_published_dates_count
    published_dates_count || published_dates.count
  end


  class << self

    def display_columns
      [
        'id',
        {
          field: 'name',
          only_in_form: true,
        },
        'address', 'phone_number', 'email',
        'website', 'established_year', 'ceo_name',
        'display_published_dates_count',
        'active', 'created_at', 'updated_at',
      ]
    end

    def count_by_book_ids(ids)
      model = 'book'
      column_name = "#{model}_id"
      join_table_name = model.to_s.pluralize
      Publisher.joins(join_table_name.to_sym).
        where(%Q{ published_dates.#{column_name} in (?) }, ids).
        group(column_name).count('distinct publishers.id')
    end
  end
end
