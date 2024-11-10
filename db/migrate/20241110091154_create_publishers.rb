class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.string :name             # Name of the publisher
      t.string :address          # Address of the publisher's headquarters
      t.string :phone_number     # Contact phone number
      t.string :email            # Contact email address
      t.integer :established_year # Year the publisher was founded
      t.string :website          # Official website of the publisher
      t.string :ceo_name         # Name of the CEO or founder
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
