class Publisher < ApplicationRecord
  has_many :published_dates, dependent: :destroy
  has_many :books, through: :published_dates
end
