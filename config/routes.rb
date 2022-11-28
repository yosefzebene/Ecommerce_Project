Rails.application.routes.draw do
  root 'products#index'

  resources :products
  resources :categories

  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
