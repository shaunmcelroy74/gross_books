class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.integer :publishing_year
      t.string :language_code
      t.decimal :book_average_rating
      t.integer :book_ratings_count
      t.string :genre
      t.string :gross_sales
      t.string :sale_price
      t.integer :sale_rank
      t.integer :units_sold
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
