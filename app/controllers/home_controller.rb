class HomeController < ApplicationController
  def index
    @books = Book.order("sale_rank").limit(10)

    @publishers = Publisher.order("publisher_name ASC").all
  end
end
