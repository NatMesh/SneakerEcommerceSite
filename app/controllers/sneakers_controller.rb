class SneakersController < ApplicationController
  def index
    #This includes statement is very important as to avoid "N+1" errors when traversing models to retrieve data
    #Limits the amount of times we hit the database
    @sneakers = Sneaker.includes(:brand, :designer, :category).order("price_cents DESC")
  end
  #The @sneakers var will be shared with:
  #app/views/sneakers/index.html.erb

  def show
    #fetches us all the data for a particular sneaker based on the id
    @sneaker = Sneaker.find(params[:id])
  end
  #The @sneaker variable will be shared with:
  #app/views/sneakers/show.html.erb
end
