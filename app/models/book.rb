class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :book_name, :publishing_year, :language_code, :book_average_rating, :book_ratings_count,
  :genre, :gross_sales, :sale_price, :sale_rank, :units_sold, presence: true
  validates :book_name, uniqueness: true
  validates :publishing_year, :book_ratings_count, :sale_rank, :units_sold, numericality: { only_integer: true }
  validates :book_average_rating, numericality: true

  def authored_by_names
    authors.map(&:author_name).join(", ")
  end
end
