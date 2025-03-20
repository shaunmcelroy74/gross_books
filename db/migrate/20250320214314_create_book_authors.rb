class CreateBookAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :book_authors do |t|
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
