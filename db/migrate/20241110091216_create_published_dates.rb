class CreatePublishedDates < ActiveRecord::Migration[7.1]
  def change
    create_table :published_dates do |t|
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.date :published_date
      t.string :edition

      t.timestamps
    end
  end
end
