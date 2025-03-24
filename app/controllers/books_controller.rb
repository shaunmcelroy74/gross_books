# app/controllers/books_controller.rb
class BooksController < ApplicationController
  def index
    if params[:q].present?
      @books = Book.where("book_name LIKE ?", "%#{params[:q]}%")
                   .includes(:publisher, :authors)
                   .order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
                   .page(params[:page])
    else
      @books = Book.includes(:publisher, :authors)
                   .order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
                   .page(params[:page])
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
