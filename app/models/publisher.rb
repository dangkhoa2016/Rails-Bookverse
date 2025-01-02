class Publisher < ApplicationRecord
  has_many :published_dates, dependent: :destroy
  has_many :books, through: :published_dates


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
        "id",
        {
          field: "name",
          only_in_form: true
        },
        "address", "phone_number", "email",
        "website", "established_year", "ceo_name",
        "display_published_dates_count",
        "active", "created_at", "updated_at"
      ]
    end
  end
end
