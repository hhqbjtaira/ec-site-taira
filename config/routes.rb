Rails.application.routes.draw do
  get 'purchase_completed', to: 'orders#purchase_completed'
  post '/add_cart', to: 'carts#add_cart'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy', as: 'logout'
  resources :orders
  resources :users
  resources :products
  resources :carts
end
