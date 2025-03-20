class PublishersController < ApplicationController
  def index
    @publisher = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
