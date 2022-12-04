Rails.application.routes.draw do
  root 'products#index'

  # Products
  get 'onsale', to: 'products#onsale'
  get 'newproducts', to: 'products#newproducts'
  get 'search', to: 'products#search'
  resources :products 
  
  resources :categories

  # Shopping cart
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  get 'shopping_cart', to: 'products#show_cart', as: 'show_cart'

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
