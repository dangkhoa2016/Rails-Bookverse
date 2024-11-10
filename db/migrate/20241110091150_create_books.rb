class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title         # Title of the book
      t.text :summary         # A brief summary or description of the book
      t.string :isbn          # International Standard Book Number (ISBN)
      t.integer :pages        # Number of pages in the book
      t.decimal :price, precision: 8, scale: 2  # Price of the book
      t.integer :stock        # Number of copies available for sale in stock
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
