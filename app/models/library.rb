class Library < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :members, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
