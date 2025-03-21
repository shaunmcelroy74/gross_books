class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).includes(:authors).order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
  end

  def show
    @book = Book.find(params[:id])
  end
end
