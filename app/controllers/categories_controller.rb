class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    #Fetches all the sneakers that belong to the category we chose
    @category = Category.find(params[:id])
    @sneakers = Category.find(params[:id]).sneakers
  end
end
