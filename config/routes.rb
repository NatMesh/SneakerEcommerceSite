Rails.application.routes.draw do
  devise_for :customers
  devise_for :users
  root to: "home#index"
  resources :sneakers, only: %i[index show]
  resources :brands, only: %i[index show]
  resources :designers, only: %i[index show]
  resources :categories, only: %i[index show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #for our routes relating to stripe payments being created, succeeding or failing we will use scoped routes
  #A way of defining routes that start with the same sub component in this case /checkout/
  #this is an alt to restful routing because the routes we will use here are outside of the normal 7 RESTful routes
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
  resources :cart, only: %i[create destroy]

end
