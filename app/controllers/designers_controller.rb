class DesignersController < ApplicationController
  def index
    @designers = Designer.all
  end

  def show
    # Fetches all the sneakers that belong to the designer we chose
    @designer = Designer.find(params[:id])
    @sneakers = Designer.find(params[:id]).sneakers.page params[:page]
  end
end
