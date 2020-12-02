class ApplicationController < ActionController::Base

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :province_id, :address, :country, :city, :postal_code, :phone_number) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, :province_id, :address, :country, :city, :postal_code, :phone_number) }
  end
end
