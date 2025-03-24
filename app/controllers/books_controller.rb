class BooksController < ApplicationController
  def index
    if params[:q].present?
      # Search by book name (case-sensitive; you could use ILIKE for PostgreSQL for case-insensitive search)
      @books = Book.where("book_name LIKE ?", "%#{params[:q]}%")
                   .includes(:publisher, :authors)
                   .order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
    else
      # Default ordering for all books (from highest to lowest gross_sales)
      @books = Book.includes(:publisher, :authors)
                   .order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
