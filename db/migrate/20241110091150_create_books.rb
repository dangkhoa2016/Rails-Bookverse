class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_date
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
