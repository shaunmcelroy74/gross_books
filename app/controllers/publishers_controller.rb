class PublishersController < ApplicationController
  def index
    if params[:q].present?
      @publishers = Publisher.where("LOWER(publisher_name) LIKE ?", "%#{params[:q].downcase}%")
    else
      @publishers = Publisher.order_by_book_count
    end
  end

  def show
    @publisher = Publisher.find(params[:id])
    @books = @publisher.books.order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
  end
end
