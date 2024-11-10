class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :address
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
