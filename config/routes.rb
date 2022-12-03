Rails.application.routes.draw do
  root 'products#index'

  #Products
  get 'onsale', to: 'products#onsale'
  get 'newproducts', to: 'products#newproducts'
  get 'search', to: 'products#search'
  resources :products 
  
  resources :categories

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
