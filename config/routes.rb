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
end
