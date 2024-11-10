class Library < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :members, dependent: :destroy
end
