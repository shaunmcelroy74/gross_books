class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher).order("sale_rank").limit(10)

    @publishers = Publisher.order_by_book_count.includes(:books).all
  end
end
