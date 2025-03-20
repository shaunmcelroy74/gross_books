class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order_by_book_count
  end

  def show
    @publisher = Publisher.find(params[:id])
    @books = @publisher.books.order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
  end
end
