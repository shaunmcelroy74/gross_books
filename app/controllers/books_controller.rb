class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order("sale_rank")
  end

  def show
    @book = Book.find(params[:id])
  end
end
