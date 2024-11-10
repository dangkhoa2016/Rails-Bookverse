class CreateAuthorProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :author_profiles do |t|
      t.references :author, null: false, foreign_key: true
      t.text :bio
      t.string :social_facebook
      t.string :social_twitter
      t.string :social_instagram
      t.string :social_linkedin
      t.string :social_youtube
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
