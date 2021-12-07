Rails.application.routes.draw do
  root "static_pages#home"
  get 'purchase_completed', to: 'orders#purchase_completed'
  delete '/carts/destroy', to: 'carts#destroy'
  patch '/carts/update', to: 'carts#update'
  post '/add_cart', to: 'carts#add_cart'
  get '/carts/show', to: 'carts#show'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy', as: 'logout'
  resources :orders
  resources :users, only: [:edit, :show, :update, :destroy]
  resources :products
end
