class Publisher < ApplicationRecord
  has_many :books
  has_many :authors, through: :books

  validates :publisher_name, presence: true, uniqueness: true

  def self.order_by_book_count
    # SELECT count(publishers.id) as book_count, Publishers.*
    # FROM Publishers
    #   LEFT OUTER JOIN books on books.publisher_id = publishers.id
    # GROUP BY publishers.id
    # ORDER BY book_count DESC;
    @publishers = Publisher.select("publishers.*")
                           .left_joins(:books)
                           .select("publishers.*, COUNT(books.id) AS books_count")
                           .group("publishers.id")
                           .order("books_count DESC")
  end
end
