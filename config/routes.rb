Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  resources :sneakers, only: %i[index show]
  resources :brands, only: %i[index show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
