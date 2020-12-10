class CartController < ApplicationController
  #POST /cart
  #Data sent as form data (params)
  def create
    #Add params[:id] to cart.
    logger.debug("Adding #{params[:id]} and #{params[:sneaker_size]} to the cart")
    id = params[:id].to_i
    size = params[:sneaker_size].to_f
    sneaker = Sneaker.find(id)
    flash[:notice] = "#{sneaker.name} size #{size} was added to cart."

    does_not_exists_in_session = true

    session[:shopping_cart].each do |item|
      if item["id"] == id
        item["quantity"] += 1
        item["size"].push(size)
        does_not_exists_in_session = false
        break
      end
    end

    if does_not_exists_in_session
      session[:shopping_cart] << {"id": id, "size": [].push(size), "quantity": 1}
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
