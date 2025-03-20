class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order("sale_rank")
  end

  def show
    @books = Book.find(params[:id])
  end
end
