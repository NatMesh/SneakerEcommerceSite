Rails.application.routes.draw do
  get 'brands/index'
  get 'brands/show'
  get 'sneakers/index'
  get 'sneakers/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
