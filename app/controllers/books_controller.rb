class BooksController < ApplicationController
  def index
    @books = Book.order("sale_rank")
  end

  def show
    @books = Book.find(params[:id])
  end
end
