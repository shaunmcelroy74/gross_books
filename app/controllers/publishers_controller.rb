class PublishersController < ApplicationController
  def index
    @publishers = Publisher.includes(:books).all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
