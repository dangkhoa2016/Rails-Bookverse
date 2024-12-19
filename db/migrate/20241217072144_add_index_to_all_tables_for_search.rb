class AddIndexToAllTablesForSearch < ActiveRecord::Migration[7.1]
  def change
    add_index :author_profiles, :social_facebook
    add_index :author_profiles, :social_twitter
    add_index :author_profiles, :social_instagram
    add_index :author_profiles, :social_linkedin
    add_index :author_profiles, :social_youtube
    add_index :author_profiles, :active
    add_index :author_profiles, :created_at
    add_index :author_profiles, :updated_at

    add_index :authors, :first_name
    add_index :authors, :last_name
    add_index :authors, :email
    add_index :authors, :active
    add_index :authors, :created_at
    add_index :authors, :updated_at

    add_index :book_loans, :borrowed_on
    add_index :book_loans, :returned_on
    add_index :book_loans, :status
    add_index :book_loans, :active
    add_index :book_loans, :created_at
    add_index :book_loans, :updated_at

    add_index :books, :title
    add_index :books, :summary
    add_index :books, :isbn
    add_index :books, :pages
    add_index :books, :price
    add_index :books, :stock
    add_index :books, :active
    add_index :books, :created_at
    add_index :books, :updated_at

    add_index :categories, :name
    add_index :categories, :active
    add_index :categories, :description
    add_index :categories, :created_at
    add_index :categories, :updated_at

    add_index :genres, :name
    add_index :genres, :active
    add_index :genres, :description
    add_index :genres, :created_at
    add_index :genres, :updated_at

    add_index :libraries, :name
    add_index :libraries, :address
    add_index :libraries, :active
    add_index :libraries, :created_at
    add_index :libraries, :updated_at

    add_index :members, :first_name
    add_index :members, :last_name
    add_index :members, :email
    add_index :members, :active
    add_index :members, :created_at
    add_index :members, :updated_at

    add_column :published_dates, :active, :boolean, default: true
    add_index :published_dates, :published_date
    add_index :published_dates, :active
    add_index :published_dates, :edition
    add_index :published_dates, :created_at
    add_index :published_dates, :updated_at

    add_index :publishers, :name
    add_index :publishers, :address
    add_index :publishers, :phone_number
    add_index :publishers, :email
    add_index :publishers, :active
    add_index :publishers, :established_year
    add_index :publishers, :website
    add_index :publishers, :ceo_name
    add_index :publishers, :created_at
    add_index :publishers, :updated_at

    add_index :reviews, :rating
    add_index :reviews, :content
    add_index :reviews, :active
    add_index :reviews, :created_at
    add_index :reviews, :updated_at

    add_index :tags, :name
    add_index :tags, :active
    add_index :tags, :created_at
    add_index :tags, :updated_at
  end
end
