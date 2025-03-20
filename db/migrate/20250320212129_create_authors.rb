class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :author_name
      t.string :author_rating

      t.timestamps
    end
  end
end
