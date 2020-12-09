class CheckoutController < ApplicationController
  #POST /checkout/create
  #A product id will be in the params hash: params[:product_id]
  def create
    #Establish a connection with Stripe and then redirect the user to the payment screen.
  end

  def success
    #We tooke the customers money!
  end

  def cancel
    #Something went wrong with the payment!
  end
end
