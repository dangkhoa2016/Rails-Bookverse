class CreateAuthorProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :author_profiles do |t|
      t.references :author, null: false, foreign_key: true
      t.text :bio
      t.text :social_links

      t.timestamps
    end
  end
end
