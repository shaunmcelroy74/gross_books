class RenamePublisherIdToAuthorIdInBookAuthors < ActiveRecord::Migration[8.0]
  def change
    rename_column :book_authors, :publisher_id, :author_id
    remove_foreign_key :book_authors, :publishers
    add_foreign_key :book_authors, :authors
  end
end
