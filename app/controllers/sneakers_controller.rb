class SneakersController < ApplicationController
  def index
    # This includes statement is very important as to avoid "N+1" errors when traversing models to retrieve data
    # Limits the amount of times we hit the database
    @sneakers = Sneaker.includes(:brand, :designer, :category).page params[:page]
  end
  # The @sneakers var will be shared with:
  # app/views/sneakers/index.html.erb

  def show
    # fetches us all the data for a particular sneaker based on the id
    @sneaker = Sneaker.find(params[:id])
    # fetches us all the sizes available for a particular sneaker
    @sizes = Sneaker.find(params[:id]).size_ranges.order("size_number ASC")
  end
  # The @sneaker variable will be shared with:
  # app/views/sneakers/show.html.erb

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @sneakers = Sneaker.where("name LIKE ?", wildcard_search)
  end
  # The @sneaker variable will be shared with:
  # app/views/sneakers/search.html.erb
end
