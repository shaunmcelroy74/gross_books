class PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/:id
  def show
    @page = Page.find(params[:id].to_s.split("-").first)
  end

  # GET /pages/:permalink
  def permalink
    @page = Page.find_by(permalink: params[:permalink])
    if @page.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/:id/edit
  def edit
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_permalink_path(@page.permalink), notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/:id
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to pages_permalink_path(@page.permalink), notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/:id
  def destroy
    @page.destroy!
    respond_to do |format|
      format.html { redirect_to pages_path, status: :see_other, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :content, :permalink)
    end
end
