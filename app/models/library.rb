class Library < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :book_loans, through: :members


  validates :name, presence: true, uniqueness: true


  attr_accessor :members_count


  def to_s
    name
  end

  def display_members_count
    members_count || members.count
  end


  class << self
    def display_columns
      [
        "id",
        {
          field: "name",
          only_in_form: true
        },
        "display_members_count",
        "active", "created_at", "updated_at"
      ]
    end
  end
end
