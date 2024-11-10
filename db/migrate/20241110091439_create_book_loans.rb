class CreateBookLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :book_loans do |t|
      t.references :book, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.date :borrowed_on
      t.date :returned_on
      t.string :status
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
