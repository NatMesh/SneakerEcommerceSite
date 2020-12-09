class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :province_id, :address, :country, :city, :postal_code, :phone_number) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, :province_id, :address, :country, :city, :postal_code, :phone_number) }
  end



  before_action :initialize_session
  helper_method :cart
  helper_method :sneaker_categories

  private


  def sneaker_categories
    #retrieves all product categories and lets them be available on all pages
    Category.all
  end

  def initialize_session
    #This is where we initialize our shopping cart.
    session[:shopping_cart] ||= [] #The shopping cart will be an array of product ids.
  end

  def cart
    #Return a collection of Product objects based on the product ids in the shopping cart.
    Sneaker.find(session[:shopping_cart])
  end
end
