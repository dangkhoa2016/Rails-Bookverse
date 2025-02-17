class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :library, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
