class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    # Fetches all the sneakers that belong to the brand we chose
    @brand = Brand.find(params[:id])
    @sneakers = Brand.find(params[:id]).sneakers.page params[:page]
  end
end
