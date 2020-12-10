class CartController < ApplicationController
  #POST /cart
  #Data sent as form data (params)
  def create
    #Add params[:id] to cart.
    logger.debug("Adding #{params[:id]} and #{params[:sneaker_size]} to the cart")
    id = params[:id].to_i
    size = params[:sneaker_size].to_f
    quantity = params[:quantity].to_i
    sneaker = Sneaker.find(id)
    flash[:notice] = "#{quantity} #{sneaker.name} size #{size} were added to cart."

    does_not_exists_in_session = true

    session[:shopping_cart].each do |item|
      if item["id"] == id && item["size"] == size
        item["quantity"] += quantity
        does_not_exists_in_session = false
        break
      end
    end

    if does_not_exists_in_session
      session[:shopping_cart] << {"id": id, "size": size, "quantity": quantity}
    end

    #session[:shopping_cart] << {"id": id, "size": size, "quantity": 1} unless session[:shopping_cart][][]
    redirect_to root_path
  end

  #DELETE /cart/:id
  def destroy
    #Remove params[:id] from the cart
    id = params[:id].to_i
    sneaker = Sneaker.find(id)
    flash[:notice] = "#{sneaker.name} was removed from cart."
    session[:shopping_cart].each do |item|
      if item["id"] == id
        session[:shopping_cart].delete(item)
        break
      end
    end
    redirect_to root_path
  end
end
