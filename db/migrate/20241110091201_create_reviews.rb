class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :book, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
