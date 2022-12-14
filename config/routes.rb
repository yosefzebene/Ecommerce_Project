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

  post 'checkout', to: 'checkout#stripe_checkout', as: 'checkout'
  get 'checkoutsuccess', to: 'checkout#confirmorder', as: 'checkout_success'
  get 'checkoutcanceled', to: 'checkout#cancelorder', as: 'checkout_cancel'

  # Customer
  get 'profile', to: 'customer#profile_options', as: 'profile'
  get 'orders', to: 'customer#list_orders', as: 'list_orders'

  resources :orders

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
