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
    if params[:q].present?
      @books = @publisher.books.where("LOWER(book_name) LIKE ?", "%#{params[:q].downcase}%")
    else
      @books = @publisher.books
    end
    @books = @books.includes(:author).order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
  end
end
