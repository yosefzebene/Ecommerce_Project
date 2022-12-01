Rails.application.routes.draw do
  root 'products#index'
  get 'products/onsale'
  get 'products/newproducts'

  resources :products 
  resources :categories

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
