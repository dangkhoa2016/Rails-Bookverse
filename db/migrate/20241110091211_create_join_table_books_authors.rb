class CreateJoinTableBooksAuthors < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :authors, table_name: 'books_authors' do |t|
      # t.index [:book_id, :author_id]
      # t.index [:author_id, :book_id]
    end
  end
end
